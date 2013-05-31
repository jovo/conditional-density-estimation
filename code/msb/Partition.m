function [nElem,MPred,group,sumWeight]=Partition(yy,dim,nPartition,nTrain,nPred,euclidean,euclideanPred,x,xPred)

  sumWeight=0;
y=cell(nPartition,1);            % variable containing observationd for each subset
nElem=cell(nPartition,1);       % variable containing number observation for each subset
group=cell(nPartition,1);                

nElem{1}=nTrain;
y{1}=reshape(yy,nTrain,1); 
seq=1:nTrain; group{1}=seq'; 
MPred(:,1)=ones(nPred,1); 

for j=1:nPartition
   s=1;
   group{j+1}=zeros(nTrain,2^j); nElem{j+1}=zeros(2^j,1);
   sumWeight=zeros(nPred,2^(j)); ind=1:2^(j);
            
   for k=1:2^(j-1)  
       B =euclidean(group{j}(1:nElem{j}(k),k),group{j}(1:nElem{j}(k),k))';
       
       % --- partition a particular subset into two subsets ---%
       [indicator]= GetPartitionThroughMetis(nElem{j}(k),B);
      
      nElem{j+1}(s)=sum(indicator==1); nElem{j+1}(s+1)=sum(indicator==2); % -- number of observations in the two sets
      group{j+1}(1:nElem{j+1}(s),s)=group{j}(indicator==1,k); group{j+1}(1:nElem{j+1}(s+1),s+1)=group{j}(indicator==2,k); 
            
      % --- compute center for each subset --- %
      meanX(1,:)=mean(x(group{j+1}(1:nElem{j+1}(s),s),:));
      meanX(2,:)=mean(x(group{j+1}(1:nElem{j+1}(s+1),s+1),:));
      
      % -- compute distance between new x and subset centers ---%
      for jj=1:nPred
        meanWeights(jj,s)=sum((meanX(1,:)-xPred(jj,:)).^2);             
        meanWeights(jj,s+1)=sum((meanX(2,:)-xPred(jj,:)).^2);             
      end
      s=s+2;
   end
   
   for jj=1:nPred % --- allocate new observation to subsets having closer center
       indF=ind(meanWeights(jj,:)==min(meanWeights(jj,:)));
       MPred(jj,j+1)=indF(1);
   end
 end
 
