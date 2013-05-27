% --- calling function MCMCFixed [running MCMC for stick breaking] ; GetPartitionFixed

clear

dataset=input('dataset?[1-data4], [2-data5], [3-data6], [4-metab], [5-neuro], [6-factor], [7-factor2], [8-lowerManifold], [9-lowerManifold],[11 factor nonlinear],[12] non linear');

[n]=input('Train/Test sample size');
nPartition=input('number partition'); 

nTrain=n(1); nPred=n(2);
n=sum(n);   % --- test+train sample size
nSim=6000; % --- upper bound number number MCMC simulations
UpperPred=n;

% --- load data ---%
[yy,x,dim,standardizeCov]=importData(dataset);  %---import dataset


if standardizeCov==1 %---standardize data
    varx=sqrt(var(x));
    x=(x(:,varx>0)-ones(length(yy),1)*mean(x(:,varx>0)))./(ones(length(yy),1)*varx(varx>0));
    yy=(yy-mean(yy))./sqrt(var(yy)); dim=sum(varx>0);
end


dim=size(x); dim=dim(2);

t = cputime;
 
euclidean=pdist(x(1:n,:));  %--- compute euclidean distances 
euclideanMatrix=zeros(n,n);

indexSum=0;
for j=1:nPred+nTrain-1
    euclideanMatrix(j,j+1:n)=euclidean(indexSum+1:indexSum+n-j); %--- buil a matrix of euclidean distances 
    indexSum=indexSum+n-j;
end

nLevels=nPartition+1;   %--number of multiresolution levels

% --- leave one out prediction---%

for indexPred=1:n
    % --- Get Partition ---%
    ind=[1:indexPred-1,indexPred+1:n];
    euclideanPred=[euclideanMatrix(1:indexPred-1,indexPred);euclideanMatrix(indexPred,indexPred+1:n)'];
    [y,nElem,yTrain,yPred,ybar,yvar,MPred,MEst,nSubsetBeforeGivenScale,nLevels,group]=GetPartitionFixed(yy(ind),yy(indexPred),nTrain,nPred,n,dim,nPartition,euclideanMatrix(ind,ind),euclideanPred);

    % --- MCMC ---%
    MSE(indexPred)=MCMCFixed(MPred,MEst,nPred,nTrain,ybar,yvar,yTrain,nSim,nSubsetBeforeGivenScale,nLevels,yPred);
    
   % % --- MCMC ---%
   % [mean(MSE(1:indexPred)) sqrt(var((MSE(1:indexPred))))]
end
% --- mean and variance squared error ---%
[mean(MSE),sqrt(var(MSE))]

% --- cput time ---%
time= cputime-t;


