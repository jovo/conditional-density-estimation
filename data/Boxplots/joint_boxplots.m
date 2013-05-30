%%%%%%%%%%%%%%%%%%%%%%%%
% swissroll
%%%%%%%%%%%%%%%%%%%%%%%%


clear 
clc

time2=([5,10,20,30,50].*10);

% --- 50,0000 predictors
load Swiss/Swiss_10000_PP_n100_pc
msePC(1,:)=mean(MSE(:,1:10));
timePC(1,:)=(time);

load Swiss/Swiss_10000_PP_cart
mseCart(1,:)=mean(MSE);
timeCart(1,:)=(time);

load Swiss/Swiss_10000_PP_lasso
mseLasso=mean(MSE(2:10,:));
timeLasso(1,:)=(time);

load Swiss/Swiss_10000_PP_msb
mseCart(1,:)=mean(MSE(:,:))./mseCart(1,:);
mseLasso(1,:)=mean(MSE(:,:))./mseLasso(1,:);
mseLasso(1,:)=mseLasso(1,:);
msePC(1,:)=mean(MSE(:,:))./msePC(1,1:10);

timeLassoB(1,:)=time./timeLasso(1,:);
timeCartB(1,:)=time./timeCart(1,:);
timeMSB(1,:)=(time);

% --- 100,0000 predictors

load Swiss/Swiss_50000_PP_n100_pc
msePC(2,:)=mean(MSE(:,1:10));
timePC(2,:)=(time);

load Swiss/Swiss_50000_PP_cart
mseCart(2,:)=mean(MSE);
timeCart(2,:)=(time);

load Swiss/Swiss_50000_PP_lasso
mseLasso(2,:)=mean(MSE);
timeLasso(2,:)=(time);

load Swiss/Swiss_50000_PP_msb
mseLasso(2,:)=mean(MSE(:,:))./mseLasso(2,:);
mseCart(2,:)=mean(MSE(:,:))./mseCart(2,:);
timeLassoB(2,:)=time./timeLasso(2,:);
timeCartB(2,:)=time./timeCart(2,:);
timeMSB(2,:)=(time);
msePC(2,:)=mean(MSE(:,:))./msePC(2,:);

load Swiss/ratio rL rC rPC

%% %----- boxplots ----- %


figh=figure(3), clf
set(0,'DefaultAxesFontSize',14)
subplot(2,3,1)
index=1:2;

month = repmat(time2(index),1,3);
simobs = [repmat({'Cart'},1,length(index)),repmat({'Lasso'},1,length(index)),repmat({'PC'},1,length(index))];
h=boxplot([mseCart(index,:)',mseLasso(index,:)',msePC(index,:)'],{month,simobs},'colors',repmat('rkg',1,length(index)),'factorseparator',[1],'labelverbosity','minor','plotstyle','traditional','labelorientation','horizontal','boxstyle','outline','notch','on','symbol','+');
ylim([0,1.2])
% set(gca,'xtick',2.5:3.5:15)
set(gca,'ytick',[0,0.5,1],'yticklabel',[{0}; {''}; {1}])
% set(h(5,:),'Visible','off')
set(gca,'LineWidth',1.1)
xlabel('p','fontsize',14)
set(gca,'FontSize',14)
set(gca,'xtick',[2:3:9],'xticklabel',time2(index)*1000)
set(gca,'xtick',[2:3:9],'xticklabel',[{'50k'}; {'100k'}])
% xlhand = get(gca,'title')
% xlabh = get(gca,'XLabel');
% set(xlabh,'Position',[220 -30 0])
hold
plot([0:49],ones(1,50),'--','Color','k')
ylabel('MSE Ratio','fontsize',14)
title('Swissroll', 'FontSize', 14)

ylim([0,1.1])


subplot(2,3,4)
index=[100,200,300];
set(0,'DefaultAxesFontName','Arial')
set(0,'DefaultAxesFontSize',14)

month = repmat(index,1,3);
simobs = [repmat({'Cart'},1,length(index)),repmat({'Lasso'},1,length(index)),repmat({'PC'},1,length(index))];
h=boxplot([rC,rL,rPC],{month,simobs},'colors',repmat('rkg',1,length(index)),'factorseparator',[1],'labelverbosity','minor','plotstyle','traditional','labelorientation','horizontal','notch','on','symbol','+');
ylim([0,1.1])

% set(h(5,:),'Visible','off')
set(gca,'LineWidth',1.1)
% set(gca,'xtick',2.6:4.1:15)
% set(gca,'xticklabel',index)
set(gca,'xtick',[2:3:9],'xticklabel',[{'100'}; {'200'}; {'300'}])
set(gca,'ytick',[0,0.5,1],'yticklabel',[{0}; {''}; {1}])
set(gca,'FontSize',14)
% xlhand = get(gca,'title')
hold
plot([0:49],ones(1,50),'--','Color','k')
ylabel('Time Ratio','fontsize',14)
xlabhh=xlabel('sample size','fontsize',14); % xlabel('n','fontsize',14)
ass=get(xlabhh);
set(xlabhh,'Position',ass.Position+[0 -200 0]);
% title('(IV)', 'FontSize', 14)
% xlabh = get(gca,'XLabel');
% set(xlabh,'Position',[35 -15 0])




%% %%%%%%%%%%%%%%%%%%%%%%%
% linear subspace
%%%%%%%%%%%%%%%%%%%%%%%%%%


clear
time2=([1,5,7,9,10,20,30,50,70].*10);

% 1 --- 10,0000 predictors 

load linear/dataFactor_k5_p10000_PP_cart
mseCart(1,1:19)=MSE;
timeCart(1,1:19)=(time);

load linear/dataFactor_k5_p10000_PP_lasso
mseLasso=MSE;
timeLasso(1,:)=(time);

load linear/dataFactor_k5_p10000_PP_n100_msb MSE time
mseCart(1,1:19)=(MSE(:,1:19))./mseCart(1,1:19);
mseLasso(1,1:20)=(MSE(:,1:20))./mseLasso(1,1:20);
timeLassoB(1,:)=time./timeLasso(1,:);
timeCartB(1,:)=time./timeCart(1,:);
timeMSB(1,:)=(time);

% 2 --- 50,0000 predictors


load linear/dataFactor_k5_p50000_PP_pc
msePC(2,:)=MSE;
timePC(2,:)=(time);

load linear/dataFactor_k5_p50000_PP_n100_cart
mseCart(2,:)=MSE;
timeCart(2,:)=(time);

load linear/dataFactor_k5_p50000_PP_n100_lasso
mseLasso(2,:)=MSE;
timeLasso(2,:)=(time);

load linear/dataFactor_k5_p50000_PP_n100_msb MSE time
mseCart(2,1:20)=MSE./mseCart(2,:);
mseLasso(2,:)=MSE./mseLasso(2,:);
msePC(2,:)=MSE./msePC(2,:);
timePCB(2,:)=time./timePC(2,:);
timeLassoB(2,:)=time./timeLasso(2,:);
timeCartB(2,:)=time./timeCart(2,:);
timeMSB(2,:)=(time);


% 3 --- 70,0000 predictors
load linear/dataFactor_k5_p70000_PP_n100_pc
msePC(3,:)=MSE;
timePC(3,:)=(time);

load linear/dataFactor_k5_p70000_PP_n100_cart
mseCart(3,:)=MSE;
timeCart(3,:)=(time);

load linear/dataFactor_k5_p70000_PP_n100_lasso
mseLasso(3,:)=MSE;
timeLasso(3,:)=(time);

load linear/dataFactor_k5_p70000_PP_n100_msb MSE time
msePC(3,1:20)=MSE./msePC(3,:);
mseCart(3,1:20)=MSE./mseCart(3,:);
mseLasso(3,:)=MSE./mseLasso(3,:);
timeLassoB(3,:)=time./timeLasso(3,:);
timeCartB(3,:)=time./timeCart(3,:);
timeMSB(3,:)=(time);
timePCB(3,:)=time./timePC(3,:);


 % 4 --- 90,0000 predictors

load linear/dataFactor_k5_p90000_PP_n100_pc
 msePC(4,:)=MSE;
 timePC(4,:)=(time);

 load linear/dataFactor_k5_p90000_PP_n100_cart
 mseCart(4,:)=MSE;
 timeCart(4,:)=(time);

load linear/dataFactor_k5_p90000_PP_n100_lasso
mseLasso(4,:)=MSE;
timeLasso(4,:)=(time);

load linear/dataFactor_k5_p90000_PP_n100_msb MSE time
mseCart(4,1:20)=MSE./mseCart(4,:);
mseLasso(4,:)=MSE./mseLasso(4,:);
timeLassoB(4,:)=time./timeLasso(4,:);
timeCartB(4,:)=time./timeCart(4,:);
timeMSB(4,:)=(time);
msePC(4,1:20)=MSE./msePC(4,:);
timePCB(4,:)=time./timePC(4,:);



 % 5 --- 100,0000 predictors
load linear/dataFactor_k5_p100000_PP_pc
msePC(5,:)=MSE;
timePC(5,:)=(time);

load linear/dataFactor_k5_p100000_PP_n100_cart
mseCart(5,1:19)=MSE;
timeCart(5,1:19)=(time);

load linear/dataFactor_k5_p100000_PP_n100_lasso
mseLasso(5,:)=MSE;
timeLasso(5,:)=(time);

load linear/dataFactor_k5_p100000_PP_n100_msb MSE time
mseCart(5,1:20)=MSE./mseCart(5,:);
mseLasso(5,:)=MSE./mseLasso(5,:);
timeLassoB(5,:)=time./timeLasso(5,:);
timeCartB(5,:)=time./timeCart(5,:);
timeMSB(5,:)=(time);
msePC(5,:)=MSE./msePC(5,:);
timePCB(5,:)=time./timePC(5,:);



%% 6 --- 200,0000 predictors
load linear/dataFactor_k5_p200000_PP_10rep_n100_pc
msePC(6,1:10)=(MSE(1:10));
timePC(6,1:10)=(time(1:10));

load linear/dataFactor_k5_p200000_PP_10rep_n100_cart MSE time
mseCart(6,1:10)=(MSE(:,1:10));
timeCart(6,1:10)=(time(1:10));

load linear/dataFactor_k5_p200000_PP_10rep_n100_lasso MSE time
mseLasso(6,1:10)=(MSE(:,1:10));
timeLasso(6,1:10)=(time(1:10));

load linear/dataFactor_k5_p200000_PP_10rep_n100_msb MSE time
msePC(6,1:10)=MSE(:,1:10)./msePC(6,1:10);
timePCB(6,1:10)=(time(:,1:10))./timePC(6,1:10);
mseCart(6,1:10)=MSE(:,1:10)./mseCart(6,1:10);
mseLasso(6,1:10)=MSE(:,1:10)./mseLasso(6,1:10);
timeLassoB(6,1:10)=time(1:10)./timeLasso(6,1:10);
timeCartB(6,1:10)=time(1:10)./timeCart(6,1:10);
timeMSB(6,1:10)=(time(1:10));

load linear/dataFactor_k5_p200000_PP_10rep2_n100_pc
msePC(6,11:20)=MSE(:,1:10);
timePC(6,11:20)=(time(1:10));

load linear/dataFactor_k5_p200000_PP_10rep2_n100_cart MSE time
mseCart(6,11:20)=MSE(:,1:10);
timeCart(6,11:20)=(time(1:10));

load linear/dataFactor_k5_p200000_PP_10rep2_n100_lasso MSE time
mseLasso(6,11:20)=MSE(:,1:10);
timeLasso(6,11:20)=(time(1:10));

load linear/dataFactor_k5_p200000_PP_10rep2_n100_MSB MSE time
msePC(6,11:20)=MSE(:,1:10)./mseCart(6,11:20);
timePCB(6,11:20)=MSE(:,1:10)./timePC(6,11:20);
mseCart(6,11:20)=MSE(:,1:10)./mseCart(6,11:20);
mseLasso(6,11:20)=MSE(:,1:10)./mseLasso(6,11:20);
timeLassoB(6,11:20)=time(1:10)./timeLasso(6,11:20);
timeCartB(6,11:20)=time(1:10)./timeCart(6,11:20);
timeMSB(6,11:20)=(time(1:10));



%% 7 --- 300,0000 predictors
load linear/dataFactor_k5_p300000_PP_n100_cart MSE time
mseCart(7,:)=MSE;
timeCart(7,:)=time;


load linear/dataFactor_k5_p300000_PP_10rep_n100_pc MSE time
mseCP(7,1:10)=(MSE(:,1:10));
timePC(7,1:10)=(time(1:10));

load linear/dataFactor_k5_p300000_PP_10rep_n100_lasso MSE time
mseLasso(7,1:10)=(MSE(:,1:10));
timeLasso(7,1:10)=(time(1:10));

load linear/dataFactor_k5_p300000_PP_10rep_n100_MSB MSE time
mseLasso(7,1:10)=(MSE(:,1:10))./mseLasso(7,1:10);
timeLassoB(7,1:10)=(time(1:10))./timeLasso(7,1:10);
timeMSB(7,1:10)=(time(1:10));
timeCartB(7,1:10)=(time(1:10))./timeCart(7,1:10);
timePCB(7,1:10)=(time(1:10))./timePC(7,1:10);

load linear/dataFactor_k5_p300000_PP_10rep2_n100_lasso time
timeLasso(7,11:20)=(time(1:10));

load linear/dataFactor_k5_p300000_PP_10rep2_n100_pc time
timePC(7,11:20)=(time(1:10));

load linear/dataFactor_k5_p300000_PP_10rep_n100_MSB time
timeLassoB(7,11:20)=(time(1:10))./timeLasso(7,11:20);
timeMSB(7,11:20)=(time(1:10));
timeCartB(7,11:20)=(time(1:10))./timeCart(7,11:20);
timePCB(7,11:20)=(time(1:10))./timePC(7,11:20);

%% 8 --- 500,0000 predictors
load linear/dataFactor_k5_p500000_PP_n100_cart MSE time
timeCart(8,:)=time;

load linear/dataFactor_k5_p500000_PP_10rep_n100_pc MSE time
timePC(8,1:10)=(time(1:10));
timePC(8,11:20)=(time(1:10));

load linear/dataFactor_k5_p500000_PP_10rep_n100_lasso MSE time
timeLasso(8,1:10)=(time(1:10));


load linear/dataFactor_k5_p500000_PP_10rep_n100_MSB MSE time
timeLassoB(8,1:10)=(time(1:10))./timeLasso(8,1:10);
timeMSB(8,1:10)=(time(1:10));
timeCartB(8,1:10)=(time(1:10))./timeCart(8,1:10);
timePCB(8,1:10)=(time(1:10))./timePC(8,1:10);
timePCB(8,1:10)=(time(1:10))./timePC(8,1:10);

load linear/dataFactor_k5_p500000_PP_10rep2_n100_lasso MSE time
timeLasso(8,11:20)=(time(1:10));

load linear/dataFactor_k5_p500000_PP_10rep_n100_MSB MSE time
timeLassoB(8,11:20)=(time(1:10))./timeLasso(8,11:20);
timeCartB(8,11:20)=(time(1:10))./timeCart(8,11:20);
timePCB(8,11:20)=(time(1:10))./timePC(8,11:20);
timePCB(8,11:20)=(time(1:10))./timePC(8,11:20);
timeMSB(8,11:20)=(time(1:10));

%% figure

set(0,'DefaultAxesFontName','Arial','DefaultAxesFontSize',14)

subplot(2,3,2)
index=[5 7 8] ; %5
month = repmat(time2(index),1,3);
msePC=[msePC; nan(3,20)];
simobs = [repmat({'Cart'},1,length(index)),repmat({'Lasso'},1,length(index)),repmat({'PC'},1,length(index))];
h=boxplot([mseCart(index,:)',mseLasso(index,:)',msePC(index,:)'],{month,simobs},'colors',repmat('rkg',1,length(index)),'factorseparator',[1],'labelverbosity','minor','plotstyle','traditional','labelorientation','horizontal','notch','on','symbol','+');
ylim([0,1.4])
%set(gca,'xtick',1.5:3.1:15)
% set(gca,'xtick',[2:3:15],'xticklabel',time2(index))
set(gca,'xtick',[2:3:20],'xticklabel',[{'100k'}; {'300k'}; {'500k'}])
set(gca,'ytick',[0,0.5,1],'yticklabel',[{0}; {''}; {1}])
% set(h(5,:),'Visible','off')
% xlabel('p (x1000)','fontsize',14)
title('Linear Subspace', 'FontSize', 14)
% set(gca,'xticklabel',time2(index))
set(gca,'LineWidth',1.05)
set(gca,'FontSize',14)
% xlhand = get(gca,'title')
hold on
plot([0:17],ones(1,18),'--','Color','k')
xlabel('p','fontsize',14)

% ylabel('t_{MSE}','fontsize',14)
% xlabh = get(gca,'XLabel');
% set(xlabh,'Position',[80 -30 0])
% wh=[4 3]; % width & height
% set(gcf,'PaperSize',wh,'PaperPosition',[0 0 wh],'Color','w');



subplot(235), %cla
% index=[5 6 7] ; %5
month = repmat(time2(index),1,3);
simobs = [repmat({'Cart'},1,length(index)),repmat({'Lasso'},1,length(index)),repmat({'PC'},1,length(index))];
timePCB=[timePCB; nan(3,20)];
h=boxplot([timeCartB(index,:)',timeLassoB(index,:)',timePCB(index,:)'],{month,simobs},'colors',repmat('rkg',1,length(index)),'factorseparator',[1],'labelverbosity','minor','plotstyle','traditional','labelorientation','horizontal','boxstyle','outline','notch','on','symbol','+');
ylim([0,4])
xlabel('p','fontsize',14)
% set(gca,'xtick',[2:3:15],'xticklabel',time2(index))
set(gca,'xtick',[2:3:20],'xticklabel',[{'100k'}; {'300k'}; {'500k'}])
set(gca,'LineWidth',1.05)
set(gca,'FontSize',14)
hold on
plot([0:17],ones(1,18),'--','Color','k')
ass=get(gca);
set(gca,'OuterPosition',ass.OuterPosition+[-0.02 0 0.02 0.005])

%% %%%%%%%%%%%%%%%%%%%%%
% MFA
%%%%%%%%%%%%%%%%%%%%%%%%


clear 
clc


time2=([5,10,20,30,50].*10);

% 1 --- 50,0000 predictors
load MFA/MFA_p50000_N5_PP_n100_pc MSE time
msePC(1,:)=(MSE);
timePC(1,:)=(time);

load MFA/MFA_p50000_N5_PP_n100_cart MSE time
mseCart(1,:)=(MSE);
timeCart(1,:)=(time);

load MFA/MFA_p50000_N5_PP_n100_lasso MSE time
mseLasso=(MSE);
timeLasso(1,:)=(time);

load MFA/MFA_p50000_N5_PP_n100_MSB MSE time
mseCart(1,:)=(MSE(:,:))./mseCart(1,:);
mseLasso(1,1:20)=(MSE(:,1:20))./mseLasso(1,1:20);
timeLassoB(1,:)=time./timeLasso(1,:);
timeCartB(1,:)=time./timeCart(1,:);
timeMSB(1,:)=(time);
msePC(1,:)=(MSE)./msePC(1,:);
timePCB(1,:)=time./timePC(1,:);

% 2 --- 100,0000 predictors
load MFA/MFA_p100000_N5_PP_n100_pc MSE time
msePC(2,:)=(MSE);
timePC(2,:)=(time);

load MFA/MFA_p100000_N5_PP_n100_cart MSE time
mseCart(2,:)=(MSE);
timeCart(2,:)=(time);

load MFA/MFA_p100000_N5_PP_n100_lasso MSE time
mseLasso(2,:)=(MSE);
timeLasso(2,:)=(time);

load MFA/MFA_p100000_N5_PP_n100_MSB MSE time
mseCart(2,1:19)=(MSE(:,1:19))./mseCart(2,1:19);
mseLasso(2,1:20)=(MSE(:,1:20))./mseLasso(2,1:20);
timeLassoB(2,:)=time./timeLasso(2,:);
timeCartB(2,:)=time./timeCart(2,:);
timeMSB(2,:)=(time);
msePC(2,:)=(MSE(:,:))./msePC(2,:);
timePCB(2,:)=time./timePC(2,:);



%% %----- boxplots ----- %

set(0,'DefaultAxesFontSize',14)
subplot(2,3,3)
index=1:2;

month = repmat(time2(index),1,3);
simobs = [repmat({'Cart'},1,length(index)),repmat({'Lasso'},1,length(index)),repmat({'PC'},1,length(index))];
h=boxplot([mseCart(index,:)',mseLasso(index,:)',msePC(index,:)'],{month,simobs},'colors',repmat('rkg',1,length(index)),'factorseparator',[1],'labelverbosity','minor','plotstyle','traditional','labelorientation','horizontal','notch','on','symbol','+');
ylim([0,1.2])
% set(gca,'xtick',2.5:3.5:15)
set(gca,'ytick',[0,0.5,1],'yticklabel',[{0}; {''}; {1}])
% set(h(5,:),'Visible','off')
set(gca,'LineWidth',1.1)
% xlabel('p (x1000)','fontsize',14)
set(gca,'FontSize',14)
% set(gca,'xtick',[2:3:9],'xticklabel',time2(index))
set(gca,'xtick',[2:3:9],'xticklabel',[{'50k'}; {'100k'}])
xlhand = get(gca,'title')
xlabh = get(gca,'XLabel');
% set(xlabh,'Position',[220 -30 0])
xlabel('p','fontsize',14)

hold
plot([0:49],ones(1,50),'--','Color','k')
% ylabel('t_{MSE}','fontsize',14)
title('Union of Linear Subspaces', 'FontSize', 14)
%wh=[2 3]; % width & height
%set(gcf,'PaperSize',wh,'PaperPosition',[0 0 wh],'Color','w');

%print('cc','-dpdf')


load MFA/ratio rL rC rPC

%%
subplot(2,3,6), cla

index=[100,200,300];
set(0,'DefaultAxesFontName','Arial')
set(0,'DefaultAxesFontSize',14)

month = repmat(index,1,3);
simobs = [repmat({'Cart'},1,length(index)),repmat({'Lasso'},1,length(index)),repmat({'PC'},1,length(index))];
h=boxplot([rC,rL,rPC],{month,simobs},'colors',repmat('rkg',1,length(index)),'notch','off','boxstyle','outline','factorseparator',[1],'plotstyle','traditional','notch','on','symbol','+');
ylim([0,1.2])

% set(gca,'xtick',[2 6 8])
% set(h(5,:),'Visible','off')
set(gca,'LineWidth',1.1)
xlabel('sample size','fontsize',14)
set(gca,'ytick',[0,0.5,1],'yticklabel',[{0}; {''}; {1}])
set(gca,'FontSize',14)
set(gca,'xticklabel',index)
xlhand = get(gca,'title');
hold
plot([0:49],ones(1,50),'--','Color','k')
% ylabel('t_{CPU}','fontsize',14)
% title('(II)', 'FontSize', 14)
% grid on
% set(gca,'xtick',[2:3:9],'xticklabel',index)
set(gca,'xtick',[2:3:9],'xticklabel',[{'100'}; {'200'}; {'300'}])
xlabh = get(gca,'XLabel');
set(xlabh,'Position',[65 -25 0])

%%
wh=[4 2]*2;
set(gcf,'PaperSize',wh,'PaperPosition',[0 0 wh],'Color','w','PaperPositionMode','manual');
xlabh = get(gca,'XLabel');
set(xlabh,'Position',[65 -25 0])

print(['../../figs/boxplots'],'-dpng','-r600')

