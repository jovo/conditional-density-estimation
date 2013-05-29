clear
time2=([1,5,7,9,10,20,30,50,70].*10);

% --- 10,0000 predictors
load dataFactor_k5_p10000_PP_cart
mseCart(1,1:19)=MSE;
timeCart(1,1:19)=(time);

load dataFactor_k5_p10000_PP_lasso
mseLasso=MSE;
timeLasso(1,:)=(time);

load dataFactor_k5_p10000_PP_n100_msb MSE time
mseCart(1,1:19)=(MSE(:,1:19))./mseCart(1,1:19);
mseLasso(1,1:20)=(MSE(:,1:20))./mseLasso(1,1:20);
timeLassoB(1,:)=time./timeLasso(1,:);
timeCartB(1,:)=time./timeCart(1,:);
timeMSB(1,:)=(time);

% --- 50,0000 predictors

load dataFactor_k5_p50000_PP_pc
msePC(2,:)=MSE;
timePC(2,:)=(time);

load dataFactor_k5_p50000_PP_n100_cart
mseCart(2,:)=MSE;
timeCart(2,:)=(time);

load dataFactor_k5_p50000_PP_n100_lasso
mseLasso(2,:)=MSE;
timeLasso(2,:)=(time);

load dataFactor_k5_p50000_PP_n100_msb MSE time
mseCart(2,1:20)=MSE./mseCart(2,:);
mseLasso(2,:)=MSE./mseLasso(2,:);
msePC(2,:)=MSE./msePC(2,:);
timePCB(2,:)=time./timePC(2,:);
timeLassoB(2,:)=time./timeLasso(2,:);
timeCartB(2,:)=time./timeCart(2,:);
timeMSB(2,:)=(time);


% --- 70,0000 predictors
load dataFactor_k5_p70000_PP_n100_pc
msePC(3,:)=MSE;
timePC(3,:)=(time);

load dataFactor_k5_p70000_PP_n100_cart
mseCart(3,:)=MSE;
timeCart(3,:)=(time);

load dataFactor_k5_p70000_PP_n100_lasso
mseLasso(3,:)=MSE;
timeLasso(3,:)=(time);

load dataFactor_k5_p70000_PP_n100_msb MSE time
msePC(3,1:20)=MSE./msePC(3,:);
mseCart(3,1:20)=MSE./mseCart(3,:);
mseLasso(3,:)=MSE./mseLasso(3,:);
timeLassoB(3,:)=time./timeLasso(3,:);
timeCartB(3,:)=time./timeCart(3,:);
timeMSB(3,:)=(time);
timePCB(3,:)=time./timePC(3,:);


 % --- 90,0000 predictors

load dataFactor_k5_p90000_PP_n100_pc
 msePC(4,:)=MSE;
 timePC(4,:)=(time);

 load dataFactor_k5_p90000_PP_n100_cart
 mseCart(4,:)=MSE;
 timeCart(4,:)=(time);

load dataFactor_k5_p90000_PP_n100_lasso
mseLasso(4,:)=MSE;
timeLasso(4,:)=(time);

load dataFactor_k5_p90000_PP_n100_msb MSE time
mseCart(4,1:20)=MSE./mseCart(4,:);
mseLasso(4,:)=MSE./mseLasso(4,:);
timeLassoB(4,:)=time./timeLasso(4,:);
timeCartB(4,:)=time./timeCart(4,:);
timeMSB(4,:)=(time);
msePC(4,1:20)=MSE./msePC(4,:);
timePCB(4,:)=time./timePC(4,:);



 % --- 100,0000 predictors
load dataFactor_k5_p100000_PP_pc
msePC(5,:)=MSE;
timePC(5,:)=(time);

load dataFactor_k5_p100000_PP_n100_cart
mseCart(5,1:19)=MSE;
timeCart(5,1:19)=(time);

load dataFactor_k5_p100000_PP_n100_lasso
mseLasso(5,:)=MSE;
timeLasso(5,:)=(time);

load dataFactor_k5_p100000_PP_n100_msb MSE time
mseCart(5,1:20)=MSE./mseCart(5,:);
mseLasso(5,:)=MSE./mseLasso(5,:);
timeLassoB(5,:)=time./timeLasso(5,:);
timeCartB(5,:)=time./timeCart(5,:);
timeMSB(5,:)=(time);
msePC(5,:)=MSE./msePC(5,:);
timePCB(5,:)=time./timePC(5,:);



%% --- 200,0000 predictors
load dataFactor_k5_p200000_PP_10rep_n100_pc
msePC(6,1:10)=(MSE(1:10));
timePC(6,1:10)=(time(1:10));

load dataFactor_k5_p200000_PP_10rep_n100_cart MSE time
mseCart(6,1:10)=(MSE(:,1:10));
timeCart(6,1:10)=(time(1:10));

load dataFactor_k5_p200000_PP_10rep_n100_lasso MSE time
mseLasso(6,1:10)=(MSE(:,1:10));
timeLasso(6,1:10)=(time(1:10));

load dataFactor_k5_p200000_PP_10rep_n100_msb MSE time
msePC(6,1:10)=MSE(:,1:10)./msePC(6,1:10);
timePCB(6,1:10)=(time(:,1:10))./timePC(6,1:10);
mseCart(6,1:10)=MSE(:,1:10)./mseCart(6,1:10);
mseLasso(6,1:10)=MSE(:,1:10)./mseLasso(6,1:10);
timeLassoB(6,1:10)=time(1:10)./timeLasso(6,1:10);
timeCartB(6,1:10)=time(1:10)./timeCart(6,1:10);
timeMSB(6,1:10)=(time(1:10));

load dataFactor_k5_p200000_PP_10rep2_n100_pc
msePC(6,11:20)=MSE(:,1:10);
timePC(6,11:20)=(time(1:10));

load dataFactor_k5_p200000_PP_10rep2_n100_cart MSE time
mseCart(6,11:20)=MSE(:,1:10);
timeCart(6,11:20)=(time(1:10));

load dataFactor_k5_p200000_PP_10rep2_n100_lasso MSE time
mseLasso(6,11:20)=MSE(:,1:10);
timeLasso(6,11:20)=(time(1:10));

load dataFactor_k5_p200000_PP_10rep2_n100_MSB MSE time
msePC(6,11:20)=MSE(:,1:10)./mseCart(6,11:20);
timePCB(6,11:20)=MSE(:,1:10)./timePC(6,11:20);
mseCart(6,11:20)=MSE(:,1:10)./mseCart(6,11:20);
mseLasso(6,11:20)=MSE(:,1:10)./mseLasso(6,11:20);
timeLassoB(6,11:20)=time(1:10)./timeLasso(6,11:20);
timeCartB(6,11:20)=time(1:10)./timeCart(6,11:20);
timeMSB(6,11:20)=(time(1:10));



%% --- 300,0000 predictors
load dataFactor_k5_p300000_PP_n100_cart MSE time
mseCart(7,:)=MSE;
timeCart(7,:)=time;


load dataFactor_k5_p300000_PP_10rep_n100_pc MSE time
mseCP(7,1:10)=(MSE(:,1:10));
timePC(7,1:10)=(time(1:10));

load dataFactor_k5_p300000_PP_10rep_n100_lasso MSE time
mseLasso(7,1:10)=(MSE(:,1:10));
timeLasso(7,1:10)=(time(1:10));

load dataFactor_k5_p300000_PP_10rep_n100_MSB MSE time
mseLasso(7,1:10)=(MSE(:,1:10))./mseLasso(7,1:10);
timeLassoB(7,1:10)=(time(1:10))./timeLasso(7,1:10);
timeMSB(7,1:10)=(time(1:10));
timeCartB(7,1:10)=(time(1:10))./timeCart(7,1:10);
timePCB(7,1:10)=(time(1:10))./timePC(7,1:10);

load dataFactor_k5_p300000_PP_10rep2_n100_lasso time
timeLasso(7,11:20)=(time(1:10));

load dataFactor_k5_p300000_PP_10rep2_n100_pc time
timePC(7,11:20)=(time(1:10));

load dataFactor_k5_p300000_PP_10rep_n100_MSB time
timeLassoB(7,11:20)=(time(1:10))./timeLasso(7,11:20);
timeMSB(7,11:20)=(time(1:10));
timeCartB(7,11:20)=(time(1:10))./timeCart(7,11:20);
timePCB(7,11:20)=(time(1:10))./timePC(7,11:20);

%% --- 500,0000 predictors
load dataFactor_k5_p500000_PP_n100_cart MSE time
timeCart(8,:)=time;

load dataFactor_k5_p500000_PP_10rep_n100_pc MSE time
timePC(8,1:10)=(time(1:10));
timePC(8,11:20)=(time(1:10));

load dataFactor_k5_p500000_PP_10rep_n100_lasso MSE time
timeLasso(8,1:10)=(time(1:10));


load dataFactor_k5_p500000_PP_10rep_n100_MSB MSE time
timeLassoB(8,1:10)=(time(1:10))./timeLasso(8,1:10);
timeMSB(8,1:10)=(time(1:10));
timeCartB(8,1:10)=(time(1:10))./timeCart(8,1:10);
timePCB(8,1:10)=(time(1:10))./timePC(8,1:10);
timePCB(8,1:10)=(time(1:10))./timePC(8,1:10);

load dataFactor_k5_p500000_PP_10rep2_n100_lasso MSE time
timeLasso(8,11:20)=(time(1:10));

load dataFactor_k5_p500000_PP_10rep_n100_MSB MSE time
timeLassoB(8,11:20)=(time(1:10))./timeLasso(8,11:20);
timeCartB(8,11:20)=(time(1:10))./timeCart(8,11:20);
timePCB(8,11:20)=(time(1:10))./timePC(8,11:20);
timePCB(8,11:20)=(time(1:10))./timePC(8,11:20);
timeMSB(8,11:20)=(time(1:10));

figure

set(0,'DefaultAxesFontName','Arial','DefaultAxesFontSize',14)

subplot(1,2,1)
index=[2 4 6] ; %5
month = repmat(time2(index),1,3);
simobs = [repmat({'Cart'},1,length(index)),repmat({'Lasso'},1,length(index)),repmat({'PC'},1,length(index))];
h=boxplot([mseCart(index,:)',mseLasso(index,:)',msePC(index,:)'],{month,simobs},'colors',repmat('rkg',1,length(index)),'factorgap',[13 2],'labelverbosity','minor','plotstyle','compact','labelorientation','horizontal');
ylim([0,1.4])
%set(gca,'xtick',1.5:3.1:15)
set(gca,'xtick',1.5:4.5:15)
set(h(5,:),'Visible','off')
xlabel('p (thousands)','fontsize',14)
title('(I)', 'FontSize', 14)
set(gca,'xticklabel',time2(index))
set(gca,'LineWidth',1.05)
set(gca,'FontSize',14)
xlhand = get(gca,'title')
hold
plot(ones(1,18),'--','Color','k')
ylabel('t_{MSE}','fontsize',14)
xlabh = get(gca,'XLabel');
set(xlabh,'Position',[80 -30 0])
wh=[4 3]; % width & height
set(gcf,'PaperSize',wh,'PaperPosition',[0 0 wh],'Color','w');



subplot(1,2,2)
index=[2 5 7 8];
month = repmat(time2(index),1,3);
simobs = [repmat({'Cart'},1,length(index)),repmat({'Lasso'},1,length(index)),repmat({'PC'},1,length(index))];
 h=boxplot([timeCartB(index,:)',timeLassoB(index,:)',timePCB(index,:)'],{month,simobs},'colors',repmat('rkg',1,length(index)),'factorgap',[13 2],'labelverbosity','minor','plotstyle','compact','labelorientation','horizontal');
ylim([0,4])
set(gca,'xtick',2.1:4.9:20)
set(h(5,:),'Visible','off')
xlabel('p (thousands)','fontsize',14)
title('(II)', 'FontSize', 14)
set(gca,'xticklabel',time2(index))
set(gca,'LineWidth',1.05)
set(gca,'FontSize',14)
xlhand = get(gca,'title')
hold
plot(ones(1,18),'--','Color','k')
ylabel('t_{CPU}','fontsize',14)
xlabh = get(gca,'XLabel');
set(xlabh,'Position',[80 -30 0])
wh=[4 3]; % width & height
set(gcf,'PaperSize',wh,'PaperPosition',[0 0 wh],'Color','w');


% 
% subplot(1,2,2)
% plot(time2(1:7),[mean(timeCart(1:6,:)'),2958],'-+','Color','k')
% hold
% plot(time2(1:9),[mean(timeLasso(1:8,:)'),4098],'--x','Color','k')
% plot(time2(1:9),[mean(timeMSB(1:8,:)'),1303],'-.o','Color','k')
% title('(II)')
% xlabel('Dimension of predictor space (thousands of dimensions)','fontsize',12)
% set(gca,'LineWidth',1.05)
% set(gca,'FontSize',12)
% ylabel('Cpu time (in seconds)','fontsize',12)
% 
