function [nElem,yTrain,yPred,MPred,MEst,nSubsetBeforeGivenScale,nLevels,group,sumWeight]=GetPartitionFixed(yTrain,yPred,nTrain,nPred,n,dim,nPartition,euclidean,euclideanPred,x,xPred)

nLevels=nPartition+1;
y=cell(nLevels,1); 

% --- Get partition --- %
[nElem,MPred,group,sumWeight]=Partition(yTrain,dim,nPartition,nTrain,nPred,euclidean,euclideanPred,x,xPred);

% --- delete levels involving subsets with only one observation ---%
for j=1:nLevels
   if sum(nElem{j}<=1)~=0 
       nLevels=j-1;
       break
   end
end

MPred=MPred(:,1:nLevels);


% --- MEst: (n x #levels) matrix with (i,j) element being the subset of the jth level containing observation i
MEst(:,1)=ones(nTrain,1); 

nSubsetBeforeGivenScale(1)=0;

for s=2:nLevels
    index=1:2^(s-1);
    for j=1:nTrain   
           MEst(j,s)=index(sum(group{s}==j)==1);
    end
    nSubsetBeforeGivenScale(s)=nSubsetBeforeGivenScale(s-1)+2^(s-2);      % -- number of subsets before given scale ---%
end


