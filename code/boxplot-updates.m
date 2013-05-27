open('experiment1.fig')
%%

a=get(gcf);
fs=18;

xlabel(a.Children(1),[{''}; {'# samples'}],'Units','points','FontSize',fs,'FontName','Arial');
ylabel(a.Children(1),'Time Ratio','FontSize',fs,'FontName','Arial');
% title(a.Children(1),'Mixture of Factor Analysis','FontName','Arial','FontSize',fs);
title(a.Children(1),'')
set(a.Children(1),'FontSize',fs)
% set(a.Children(1),'Position',[1 1 543 261])

xlabel(a.Children(2),[{''}; {'# dimensions (thousands)'}],'Units','points','FontSize',fs,'FontName','Arial');
ylabel(a.Children(2),'MSE Ratio','FontSize',fs,'FontName','Arial');
% title(a.Children(2),'Mixture of Factor Analysis','FontName','Arial','FontSize',fs);
title(a.Children(2),'')
set(a.Children(2),'FontSize',fs)


wh=[5.5 2]*2;
set(gcf,'PaperSize',wh,'PaperPosition',[0 0.5 wh.*[1 0.8]],'Color','w');
print(['experiment2'],'-deps')

