function pdf=computeDensity(time,P,nLevels,MPred,ybar,yvar)

dim=size(P); dim=dim(1);

if sum(size(ybar)==1)>0
  ybar=ones(dim,1)*ybar;
  yvar=ones(dim,1)*yvar;
end
nSubsetBeforeGivenScale=[0,1,3,7,15,31,63,127,255,511];

pdf=zeros(dim(1),length(time));
for j=1:dim
    for ss=1:nLevels
        index=nSubsetBeforeGivenScale(ss)'+MPred(ss);
        pdf(j,:)=pdf(j,:)+P(j,ss)*normpdf(time,ybar(j,index),sqrt(yvar(j,index))); 
    end
end
