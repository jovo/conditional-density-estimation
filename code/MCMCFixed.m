function medianPred=MCMCFixed(MPred,MEst,nPred,nTrain,ybar,yvar,yTrain,nSim,nSubsetBeforeGivenScale,nLevels,yPred)

alpha=1./nLevels; nh=[];
V=cell(nLevels-1,1);
for s=1:nLevels-1 
    V{s}=betarnd(1,alpha,1,2^(s-1));
end
V{nLevels}=ones(1,2^(nLevels-1));

ypred=0; S=ones(nTrain,1);
randnormal=randn(nSim,nPred);
burn=500; a=1; i=1; sIndex=0;
indexLevel=1:nLevels; oneLev=ones(1,nLevels);
V{nLevels}=ones(1,2^(nLevels-1));
 

while (i<=burn | sum(a)>0) & (i<6000) 
        
        i=i+1;

        %--- evaluate probability for each data point ---%
        pie=[]; piePred=[]; p=[];
        for s=1:nLevels
            pie(:,s)=reshape(V{s}(MEst(:,s)),nTrain,1); piePred(:,s)=reshape(V{s}(MPred(:,s)),nPred,1);
            for jj=1:s-1
                pie(:,s)=pie(:,s).*reshape((1-V{jj}(MEst(:,jj))),nTrain,1);
                piePred(:,s)=piePred(:,s).*reshape((1-V{jj}(MPred(:,jj))),nPred,1);
            end
            index=nSubsetBeforeGivenScale(s)+MEst(:,s);
            p(:,s)=pie(:,s).*normpdf(yTrain,ybar(index)',sqrt(yvar(index))');
        end

        
        prob=p./(sum(p')'*oneLev);
        S=mnrnd(1,prob)*indexLevel';

        prob=piePred./sum(piePred');
        SPred=mnrnd(1,prob)*indexLevel';
       
        % --- prediction ---%
        index=nSubsetBeforeGivenScale(SPred)'+MPred(SPred);
        ypred(i)=ybar(index)+sqrt(yvar(index))*randnormal(i,1);
           
        %--- sample stick breaking weights ---%    
        ss=0; 
        for s=1:nLevels
            for jj=1:2^(s-1)
                ss=ss+1;
                nh(ss)=sum((S==s & MEst(:,s)==jj));
            end
        end
        
        for s=1:nLevels-1
            for jj=1:2^(s-1)
                extra=0; 
                for ss=s+1:nLevels
                    extra=extra+sum(nh(nSubsetBeforeGivenScale(ss)+(jj-1)*2^(ss-s)+1:nSubsetBeforeGivenScale(ss)+(jj-1)*2^(ss-s)+2^(ss-s)));
                end
            V{s}(jj)=betarnd(1+nh(nSubsetBeforeGivenScale(s)+jj),alpha+extra);
            end
        end
   
        if i>burn
            sIndex=sIndex+1;
            if sIndex==10
                ytest((i-burn)/10)=ypred(i);
                sIndex=0;
                if i>=burn+1000
                    [a b c]=swtest(ytest);
                end
            end
        end
   
end

medianPred=(yPred'-mean(ypred(burn+1:i))).^2; 


