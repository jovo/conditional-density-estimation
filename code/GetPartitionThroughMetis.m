function [part1]=GetPartitionThroughMetis(n,euclidean)

weight=exp(-euclidean); 
    
for j=1:n
    weight(j+1:n,j)=weight(j,j+1:n)';
    weight(j,j)=0;
end

weight=weight./max(max(weight));
[part1 part2]=metismex('PartGraphRecursive',sparse(weight),2); % -- call metis
part1(part1==0)=2;










