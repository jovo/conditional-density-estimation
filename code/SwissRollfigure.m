% Author: Billy Yoon Woo Byun
% Last Update: 2013-05-22

figure;
clear mu A A2

% scale = 3
A = GWT.PointsInNet(find(GWT.Scales == 3));
P1 = dx(A{1}); mu(1) = mean(P1); sig(1) = std(P1); % vari(1) = var(P1);
P2 = dx(A{2}); mu(2) = mean(P2); sig(2)= std(P2); %vari(2) = var(P2);
P3 = dx(A{3}); mu(3) = mean(P3); sig(3)= std(P3); %vari(3) = var(P3);
P4 = dx(A{4}); mu(4) = mean(P4); sig(4) = std(P4); %vari(4) = var(P4);
NofPts =  size(P1,1)+ size(P2,1) + size(P3,1) + size(P4,1)
C = zeros(NofPts, 1);
order= sort(mu);
for i = 1:4
C(A{i}) = find(order == mu(i));
end
% C(A{1}) = 2;
% C(A{2}) = 1;
% C(A{3}) = 4;
% C(A{4}) = 3;
mu

ha = tight_subplot(2,2,[.1 .05],[.1 .1],[.09 .01]); 
axes(ha(1)); 
% subplot(2,2,1);
plot3k(T, 'ColorData', C, 'ColorRange', [0 5]); colorbar off;
set(gca,'FontSize',13)
% [0.8801    0.6255    0.1220    0.3677]
title('Partitions at Scale = 3', 'FontSize', 15)
% s1 =  sprintf('Mean: %.3f Variance: %.3f',meanYi(1),varYi(1));
mu(1)
s1 = sprintf('Mean of Partition1 = %.4f',mu(2));
s2 = sprintf('Mean of Partition2 = %.4f',mu(1));
s3 = sprintf('Mean of Partition3 = %.4f',mu(4));
s4 = sprintf('Mean of Partition4 = %.4f',mu(3));
% legend('\mu(Partition1) = 0.8801','\mu(Partition2) = 0.6255','\mu(Partition3) = 0.1220','\mu(Partition4) = 0.3677')
%  0.8677    0.6121    0.3632    0.1235

% scale = 4
A2 = GWT.PointsInNet(find(GWT.Scales == 4)) 
P1 = dx(A2{1}); 
mu(1) = mean(P1); sig(1) = std(P1); % vari(1) = var(P1);
P2 = dx(A2{2}); 
 mu(2) = mean(P2); sig(2)= std(P2);% vari(2) = var(P2);
P3 = dx(A2{3}); 
 mu(3) = mean(P3); sig(3)= std(P3);% vari(3) = var(P3)
P4 = dx(A2{4}); 
 mu(4) = mean(P4); sig(4) = std(P4); %vari(4) = var(P4);
P5 = dx(A2{5}); 
 mu(5) = mean(P5); sig(5) = std(P5);% vari(5) = var(P5);
P6 = dx(A2{6}); 
 mu(6) = mean(P6); sig(6)= std(P6); %vari(6) = var(P6);
P7 = dx(A2{7}); 
 mu(7) = mean(P7); sig(7)= std(P7); %vari(7) = var(P7)
P8 = dx(A2{8}); 
 mu(8) = mean(P8); sig(8) = std(P8); %vari(8) = var(P8);
NofPts =  size(P1,1)+ size(P2,1) + size(P3,1) + size(P4,1)+...
    size(P5,1)+ size(P6,1) + size(P7,1) + size(P8,1)
C = zeros(NofPts, 1);

order= sort(mu);
for i = 1:8
C(A2{i}) = find(order == mu(i));
end
% C(A2{1}) = 4.2;
% C(A2{2}) = 3.0;
% C(A2{3}) = 1.0;
% C(A2{4}) = 1.4;
% C(A2{5}) = 8.0;
% C(A2{6}) = 9.3;
% C(A2{7}) = 6.8;
% C(A2{8}) = 5.5;
axes(ha(2)); 
% subplot(2,2,3); 
plot3k(T, 'ColorData', C, 'ColorRange', [0 10]); colorbar off;

set(gca,'FontSize',13)
% [0.8801    0.6255    0.1220    0.3677]
% s1 = sprintf('Mean of Partition1 = %.4f',mu(7));
% s2 = sprintf('Mean of Partition2 = %.4f',mu(8));
% s3 = sprintf('Mean of Partition3 = %.4f',mu(5));
% s4 = sprintf('Mean of Partition4 = %.4f',mu(6));
% s5 = sprintf('Mean of Partition5 = %.4f',mu(3));
% s6 = sprintf('Mean of Partition6 = %.4f',mu(4));
% s7 = sprintf('Mean of Partition7 = %.4f',mu(2));
% s8 = sprintf('Mean of Partition8 = %.4f',mu(1));

s1 = sprintf('Mean of Partition1 = %.4f',mu(3));
s2 = sprintf('Mean of Partition2 = %.4f',mu(4));
s3 = sprintf('Mean of Partition3 = %.4f',mu(2));
s4 = sprintf('Mean of Partition4 = %.4f',mu(1));
s5 = sprintf('Mean of Partition5 = %.4f',mu(7));
s6 = sprintf('Mean of Partition6 = %.4f',mu(8));
s7 = sprintf('Mean of Partition7 = %.4f',mu(5));
s8 = sprintf('Mean of Partition8 = %.4f',mu(6));

title('Partitions at Scale = 4','FontSize', 15)

% Real Guassian
mu = [ 0.8718    0.6227    0.3827    0.1311]

varian = mu + 1;
sd = sqrt(varian);
% s = ['r', 'k', 'b','g'];
col{1} = [0.8 0.5 0]; 
col{2} = [0.78 0.9 0]; 
col{3} = [0 0.8 0.8]; 
col{4} = [0 0 0.8]; 
axes(ha(3)); 
% subplot(2,2,2)
for i = 1:4
ix = -3*sd(i):1e-3:3*sd(i); %covers more than 99% of the curve
iy = pdf('normal', ix, mu(i), sd(i));
plot(ix,iy, 'Color', col{i}, 'LineWidth', 2.5); hold on;
end
xlabel('manifold coordinate', 'Fontsize', 13)
ylabel('likelihood', 'Fontsize', 13)
set(gca,'FontSize',13)
% legend(s1, s2, s3, s4, 'Location', 'EastOutside');
title('Phenotype Density at Scale = 3','FontSize', 15)
% legend('Partition1', 'Partition2', 'Partition3', 'Partition4')


axes(ha(4))
% subplot(2,2,4)
%   
% Real Guassian
mu = [0.8677    0.9389    0.5527    0.6801    0.3009    0.4253    0.1434    0.1062]
varian = mu + 1;
sd = sqrt(varian);
% s = ['r', 'k', 'b','g']
col{1} = [0.8 0.4 0]; 
col{2} = [0.7 0 0]; 
col{4} = [0.9 0.9 0.1]; 
col{3} = [0.4 0.9  0]; 
col{6} = [0 0.8 0.8]; 
col{5} = [0 0.5 0.7]; 
col{7} = [0 0.4 0.8]; 
col{8} = [0 0 0.7]; 

for i = 1:8
ix = -3*sd(i):1e-3:3*sd(i); %covers more than 99% of the curve
iy = pdf('normal', ix, mu(i), sd(i));
plot(ix,iy, 'Color', col{i}, 'LineWidth', 2.8); hold on;
end

title('Phenotype Density at Scale = 4', 'FontSize', 15)


% set(ha(1:4),'XTickLabel',''); set(ha,'YTickLabel','')

% legend(s1, s2, s3, s4, s5, s6, s7, s8, 'Location', 'NorthEastOutside');

% legend('\mu(P1) = 0.059', '\mu(P2) = 0.189', '\mu(P4) = 0.445', '\mu(P3) = 0.328', ...
%     '\mu(P6) = 0.686', '\mu(P5) = 0.562', '\mu(P8) = 0.940','\mu(P7) = 0.813')

set(gca,'FontSize',13)