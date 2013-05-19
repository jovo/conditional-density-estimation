function [nElem,y,MPred,group]=Partition(yy,dim,nPartition,nTrain,nPred,euclidean,euclideanPred)

y=cell(nPartition,1);            % variable containing observationd for each subset
nElem=cell(nPartition,1);       % variable containing number observation for each subset
group=cell(nPartition,1);                

nElem{1}=nTrain;
y{1}=reshape(yy,nTrain,1); 
seq=1:nTrain; group{1}=seq'; 
MPred(:,1)=ones(nPred,1); 

for j=1:nPartition
   s=1; y{j+1}=zeros(nTrain,2^j); 
   group{j+1}=zeros(nTrain,2^j); nElem{j+1}=zeros(2^j,1);
   sumWeight=zeros(nPred,2^(j)); ind=1:2^(j);
            
   for k=1:2^(j-1)  
       B =euclidean(group{j}(1:nElem{j}(k),k),group{j}(1:nElem{j}(k),k))';
       
       % --- partition a particular subset in two subsets ---%
       [indicator]= GetPartitionThroughMetis(nElem{j}(k),B);
      
      nElem{j+1}(s)=sum(indicator==1); nElem{j+1}(s+1)=sum(indicator==2); % -- number of observations in the two sets
      group{j+1}(1:nElem{j+1}(s),s)=group{j}(indicator==1,k); group{j+1}(1:nElem{j+1}(s+1),s+1)=group{j}(indicator==2,k); 
      
      y{j+1}(1:nElem{j+1}(s),s)=yy(group{j+1}(1:nElem{j+1}(s),s)); % --- allocate response in the two subsets
      y{j+1}(1:nElem{j+1}(s+1),s+1)=yy(group{j+1}(1:nElem{j+1}(s+1),s+1));
      
      for jj=1:nPred
          euclideanSumPred=euclideanPred(group{j+1}(1:nElem{j+1}(s),s)); % -- compute euclidean distance between new vector of predictors and vectors belonging to each subset
          sumWeight(jj,s)=mean(exp(-euclideanSumPred));
          euclideanSumPred=euclideanPred(group{j+1}(1:nElem{j+1}(s+1),s+1));
          sumWeight(jj,s+1)=mean(exp(-euclideanSumPred));
      end
      s=s+2;
   end
   for jj=1:nPred % --- allocate new observation
     MPred(jj,j+1)=ind(sumWeight(jj,:)==max(sumWeight(jj,:)));
   end
 end
 