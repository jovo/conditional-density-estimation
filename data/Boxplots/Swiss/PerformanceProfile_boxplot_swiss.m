clear 
clc

time2=([5,10,20,30,50].*10);

% --- 50,0000 predictors
load Swiss_10000_PP_n100_pc
msePC(1,:)=mean(MSE(:,1:10));
timePC(1,:)=(time);

load Swiss_10000_PP_cart
mseCart(1,:)=mean(MSE);
timeCart(1,:)=(time);

load Swiss_10000_PP_lasso
mseLasso=mean(MSE(2:10,:));
timeLasso(1,:)=(time);

load Swiss_10000_PP_msb
mseCart(1,:)=mean(MSE(:,:))./mseCart(1,:);
mseLasso(1,:)=mean(MSE(:,:))./mseLasso(1,:);
mseLasso(1,:)=mseLasso(1,:);
msePC(1,:)=mean(MSE(:,:))./msePC(1,1:10);

timeLassoB(1,:)=time./timeLasso(1,:);
timeCartB(1,:)=time./timeCart(1,:);
timeMSB(1,:)=(time);

% --- 100,0000 predictors

load Swiss_50000_PP_n100_pc
msePC(2,:)=mean(MSE(:,1:10));
timePC(2,:)=(time);

load Swiss_50000_PP_cart
mseCart(2,:)=mean(MSE);
timeCart(2,:)=(time);

load Swiss_50000_PP_lasso
mseLasso(2,:)=mean(MSE);
timeLasso(2,:)=(time);

load Swiss_50000_PP_msb
mseLasso(2,:)=mean(MSE(:,:))./mseLasso(2,:);
mseCart(2,:)=mean(MSE(:,:))./mseCart(2,:);
timeLassoB(2,:)=time./timeLasso(2,:);
timeCartB(2,:)=time./timeCart(2,:);
timeMSB(2,:)=(time);
msePC(2,:)=mean(MSE(:,:))./msePC(2,:);

load ratio rL rC rPC

%% %----- boxplots ----- %


set(0,'DefaultAxesFontSize',14)
subplot(1,4,3)
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
title('(III)', 'FontSize', 14)

ylim([0,1.1])


subplot(1,4,4)
index=[100,200,300];
set(0,'DefaultAxesFontName','Arial')
set(0,'DefaultAxesFontSize',14)

month = repmat(index,1,3);
simobs = [repmat({'Cart'},1,length(index)),repmat({'Lasso'},1,length(index)),repmat({'PC'},1,length(index))];
h=boxplot([rC,rL,rPC],{month,simobs},'colors',repmat('rkg',1,length(index)),'factorgap',[13 2],'labelverbosity','minor','plotstyle','compact','labelorientation','horizontal');
ylim([0,1.1])

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
title('(IV)', 'FontSize', 14)
xlabh = get(gca,'XLabel');
set(xlabh,'Position',[35 -15 0])
