function [y,nElem,yTrain,yPred,ybar,yvar,MPred,MEst,nSubsetBeforeGivenScale,nLevels,group]=GetPartitionFixed(yTrain,yPred,nTrain,nPred,n,dim,nPartition,euclidean,euclideanPred)

nLevels=nPartition+1;
y=cell(nLevels,1); 

% --- Get partition --- %
[nElem,y,MPred,group]=Partition(yTrain,dim,nPartition,nTrain,nPred,euclidean,euclideanPred);

% --- delete levels involving subsets with only 1 observation ---%
for j=1:nLevels
   if sum(nElem{j}==1)>=2 
       nLevels=j-1;
       break
   end
end

MPred=MPred(:,1:nLevels);

% --- Mean and variance of observations in each subset---%
s=0; yvar=[]; ybar=[]; 
for j=1:nLevels
    for k=1:2^(j-1)
        s=s+1;
        ybar(s)=mean(y{j}(group{j}(:,k)~=0,k));
        yvar(s)=var(y{j}(group{j}(:,k)~=0,k));
    end
 end    

nSubsetBeforeGivenScale(1)=0;

for s=2:nLevels
   nSubsetBeforeGivenScale(s)=nSubsetBeforeGivenScale(s-1)+2^(s-2);  % -- number of subsets before given scale ---%
end

% --- MEst: (n x #levels) matrix with (i,j) element being the subset of the jth level containing observation i
MEst(:,1)=ones(nTrain,1); 

for s=2:nLevels
    index=1:2^(s-1);
    for j=1:nTrain   
           MEst(j,s)=index(sum(group{s}==j)==1);
    end
end

