function [Pred,pie_pred,mu,sigma,i,meanPred,medianPred,varPred,quantPred]=MCMCBayes(MPred,MEst,nPred,nTrain,nSim,nSubsetBeforeGivenScale,nLevels,yPred,yTrain);     

lik=zeros(nTrain,1);
alpha=1; nh=[];

V=cell(nLevels-1,1);
for s=1:nLevels-1 
    V{s}=betarnd(1,alpha,1,2^(s-1));
end
V{nLevels}=ones(1,2^(nLevels-1));

ypred=0; S=ones(nTrain,1);
randnormal=randn(nSim,nPred);

burn=500; a=1; i=1; sIndex=0;

randnormalMu=randn(nSim,nSubsetBeforeGivenScale(nLevels)+2^(nLevels-1));

gamma0=5; beta0=3;

sigma(1,:)=1./gamrnd(gamma0,1/beta0,nSubsetBeforeGivenScale(nLevels)+2^(nLevels-1),1);
mu(1,:)=randn(nSubsetBeforeGivenScale(nLevels)+2^(nLevels-1),1); nh=ones(nSubsetBeforeGivenScale(nLevels)+2^(nLevels-1),1);
indexLevel=1:nLevels; oneLev=ones(1,nLevels);
zeroVec=zeros(length(nh),1); 
V{nLevels}=ones(1,2^(nLevels-1));
indexLevel=1:nLevels; oneLev=ones(1,nLevels);

while (sum(a)>0) & (i<3000) 
        
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
            
           p(:,s)=pie(:,s).*normpdf(yTrain,mu(i-1,index)',sqrt(sigma(i-1,index))');
        end
        
        prob=p./(sum(p')'*oneLev);
        S=mnrnd(1,prob)*indexLevel';

        prob=piePred./(sum(piePred')'*oneLev);
        SPred=mnrnd(1,prob)*indexLevel';
        
        pie_pred(i,:)=piePred(1,:);
        
        % --- prediction ---%
        for jj=1:nPred
            index=nSubsetBeforeGivenScale(SPred(jj))'+MPred(jj,SPred(jj));
            ypred(i,jj)=mu(i-1,index)+sqrt(sigma(i-1,index))*randnormal(i,jj);
        end
        
        %--- sample stick breaking weights ---%    
        ss=0; sumYsubset=zeroVec; sumSquareYsubset=zeroVec; 
        for s=1:nLevels
            for jj=1:2^(s-1)
            ss=ss+1;
            nh(ss)=sum((S==s & MEst(:,s)==jj));
            if nh(ss)~=0
                sumYsubset(ss)=sum(yTrain(S==s & MEst(:,s)==jj));
                sumSquareYsubset(ss)=sum(yTrain(S==s & MEst(:,s)==jj).^2);          
            end
            end
        end
   
        % --- sample mu and sigma ---%
        varMu=(1+nh./sigma(i-1,:)').^(-1);
        meanMu=sumYsubset./sigma(i-1,:)'.*varMu;
        mu(i,:)=meanMu+sqrt(varMu).*randnormalMu(i,:)';

        gamma=gamma0+nh/2;
        beta=.5*(sumSquareYsubset-2*sumYsubset.*mu(i,:)'+nh.*mu(i,:)'.^2)+beta0;
        sigma(i,:)=1./gamrnd(gamma,1./beta);
        
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
                ytest((i-burn)/10)=mean(mean(mu(i,1)));
                sIndex=0;
                if i>=burn+1000
                    [a b c]=swtest(ytest);
                end
            end
        end
   
end

medianPred=quantile(ypred(burn+1:i,:),.5)';
meanPred=mean(ypred(burn+1:i,:))';

%Pred=((yPred-medianPred).^2); 
Pred=((yPred-medianPred).^2); 

varPred=sqrt(var(ypred(burn+1:i,:)))';
quantPred=quantile(ypred(burn+1:i,:),[.025,.5,.975]);
