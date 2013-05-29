clear
clc

tic
nPartition=6; 
bayes=1; dummy=0;
%[yy,x,dim,standardizeCov]=importData(5); euclidean=1;

%[yy,x,dim,euclideanMatrix,euclidean]=importDataReal(2,dummy);

%load xFactor5_5000
load SwissExample_10000
euclidean=1; 

t=-3:.01:3;

n=100; x=x(1:n,:); yy=yy(1:n);

nPred=1; nTrain=n-nPred; nTot=20;

n=length(yy);  
nSim=6000; % --- upper bound number number MCMC simulations
UpperPred=n; dim=size(x);

yy=(yy-mean(yy))./sqrt(var(yy));

%--- stand ---%

sss=0;
for j=1:dim(2)
	 varx(j)=sqrt(var(x(:,j)));
    if varx(j)~=0 x(:,j)=(x(:,j)-mean(x(:,j)))./varx(j);
end
end


if euclidean==1
    % --- euclidean ---%
    dim=size(x); dim=dim(2);
    euclideanMatrix=zeros(n,n);
    for j=1:n-1
        dist=(ones(n-j,1)*x(j,:)-x(j+1:n,:)).^2; dist(dist>1)=1;
        euclideanMatrix(j,j+1:n)=sum(dist');  %--- compute euclidean distances 
        euclideanMatrix(j+1:n,j)=sum(dist')';  %--- compute euclidean distances 
    end
end

toc

nLevels=nPartition+1   %--number of multiresolution levels


%---- Leave one out prediction ----%

for indexPred=1:n
 
    % --- Get Partition ---%
    ind=[1:indexPred-1,indexPred+1:n];
    euclideanPred=[euclideanMatrix(1:indexPred-1,indexPred); euclideanMatrix(indexPred,indexPred+1:n)'];
   
    [nElem,yTrain,yPred,MPred,MEst,nSubsetBeforeGivenScale,nLevels,group,sumWeight]=GetPartitionFixed(yy(ind),yy(indexPred),nTrain,nPred,n,dim,nPartition,euclideanMatrix(ind,ind),euclideanPred,x(ind,:),x(indexPred,:));

    dd=nSubsetBeforeGivenScale(nLevels)+2^(nLevels-1);
    
    % % --- MCMC ---%
    [MSE(indexPred),piePred,ybar,yvar,i,meanPred(indexPred),medianPred(indexPred),varPred(indexPred),quantPred(:,indexPred)]=MCMCBayes(MPred,MEst,nPred,nTrain,nSim,nSubsetBeforeGivenScale,nLevels,yPred,yTrain);      

    [indexPred,mean(MSE(1:indexPred)) sqrt(var((MSE(1:indexPred))))]
    
    pdf=computeDensity(t,piePred,nLevels,MPred,ybar,yvar);
    pdfInt(:,:,indexPred)=quantile(pdf,[.25,.5,.75,.025,.975]); % save pdf statistics

end

