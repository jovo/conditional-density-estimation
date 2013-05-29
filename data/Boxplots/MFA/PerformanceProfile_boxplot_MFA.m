clear 
clc


time2=([5,10,20,30,50].*10);

% --- 50,0000 predictors
load MFA_p50000_N5_PP_n100_pc MSE time
msePC(1,:)=(MSE);
timePC(1,:)=(time);

load MFA_p50000_N5_PP_n100_cart MSE time
mseCart(1,:)=(MSE);
timeCart(1,:)=(time);

load MFA_p50000_N5_PP_n100_lasso MSE time
mseLasso=(MSE);
timeLasso(1,:)=(time);

load MFA_p50000_N5_PP_n100_MSB MSE time
mseCart(1,:)=(MSE(:,:))./mseCart(1,:);
mseLasso(1,1:20)=(MSE(:,1:20))./mseLasso(1,1:20);
timeLassoB(1,:)=time./timeLasso(1,:);
timeCartB(1,:)=time./timeCart(1,:);
timeMSB(1,:)=(time);
msePC(1,:)=(MSE)./msePC(1,:);
timePCB(1,:)=time./timePC(1,:);

% --- 100,0000 predictors
load MFA_p100000_N5_PP_n100_pc MSE time
msePC(2,:)=(MSE);
timePC(2,:)=(time);

load MFA_p100000_N5_PP_n100_cart MSE time
mseCart(2,:)=(MSE);
timeCart(2,:)=(time);

load MFA_p100000_N5_PP_n100_lasso MSE time
mseLasso(2,:)=(MSE);
timeLasso(2,:)=(time);

load MFA_p100000_N5_PP_n100_MSB MSE time
mseCart(2,1:19)=(MSE(:,1:19))./mseCart(2,1:19);
mseLasso(2,1:20)=(MSE(:,1:20))./mseLasso(2,1:20);
timeLassoB(2,:)=time./timeLasso(2,:);
timeCartB(2,:)=time./timeCart(2,:);
timeMSB(2,:)=(time);
msePC(2,:)=(MSE(:,:))./msePC(2,:);
timePCB(2,:)=time./timePC(2,:);



%% %----- boxplots ----- %

set(0,'DefaultAxesFontSize',14)
subplot(1,4,1)
index=1:2;

month = repmat(time2(index),1,3);
simobs = [repmat({'Cart'},1,length(index)),repmat({'Lasso'},1,length(index)),repmat({'PC'},1,length(index))];
h=boxplot([mseCart(index,:)',mseLasso(index,:)',msePC(index,:)'],{month,simobs},'colors',repmat('rkg',1,length(index)),'factorgap',[13 2],'labelverbosity','minor','plotstyle','compact','labelorientation','horizontal');
ylim([0,1.2])
set(gca,'xtick',2.5:3.5:15)
set(gca,'ytick',[0,1])
set(h(5,:),'Visible','off')
set(gca,'LineWidth',1.1)
xlabel('p (thousands)','fontsize',14)
set(gca,'FontSize',14)
 set(gca,'xticklabel',time2(index))
xlhand = get(gca,'title')
xlabh = get(gca,'XLabel');
set(xlabh,'Position',[220 -30 0])

hold
plot(ones(1,50),'--','Color','k')
ylabel('t_{MSE}','fontsize',14)
title('(I)', 'FontSize', 14)
%wh=[2 3]; % width & height
%set(gcf,'PaperSize',wh,'PaperPosition',[0 0 wh],'Color','w');

%print('cc','-dpdf')


load ratio rL rC rPC

subplot(1,4,2)
index=[100,200,300];
set(0,'DefaultAxesFontName','Arial')
set(0,'DefaultAxesFontSize',14)

month = repmat(index,1,3);
simobs = [repmat({'Cart'},1,length(index)),repmat({'Lasso'},1,length(index)),repmat({'PC'},1,length(index))];
h=boxplot([rC,rL,rPC],{month,simobs},'colors',repmat('rkg',1,length(index)),'factorgap',[13 2],'labelverbosity','minor','plotstyle','compact','labelorientation','horizontal');
ylim([0,1.2])

set(gca,'xtick',2.6:4.1:15)
set(h(5,:),'Visible','off')
set(gca,'LineWidth',1.1)
xlabel('n','fontsize',14)
set(gca,'ytick',[0,1])
set(gca,'FontSize',14)
 set(gca,'xticklabel',index)
xlhand = get(gca,'title')
hold
plot(ones(1,50),'--','Color','k')
ylabel('t_{CPU}','fontsize',14)
title('(II)', 'FontSize', 14)
xlabh = get(gca,'XLabel');
set(xlabh,'Position',[35 -15 0])
