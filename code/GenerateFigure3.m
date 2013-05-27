
clear
clc
set(0,'DefaultAxesFontName','Arial')
index1=[ 1 18]% 16 25];
    
% --- load data
load illustrative2 yy
n=100; my=mean(yy(1:n)); vy=sqrt(var(yy(1:n)));

figure

load illustrativeJ_MSB_n100


 for j=1:2
    subplot(2,3,1+3*(j-1))
    % -- plot confidence interval ---%
    plot(t,pdfInt(4,:,j),'--','Color','k','Linewidth',1)
    hold
    plot(t,pdfInt(5,:,j),'--','Color','k','Linewidth',1)
    plot(t,pdfInt(2,:,j),'Color','k','Linewidth',1)
    set(gca,'LineWidth',1.1)
    lim=1;
        if j==1 lim=.9;
    else if j==2 lim=.6; end 
        end
    xlim([-4,4])
    ylim([0,lim])
    set(gca,'ytick',[0,lim])
    p=abs(eta(index1(j)));
    % -- plot true density
    d=p*normpdf(t,(2-my)/vy,1/vy)+(1-p)*normpdf(t,(-2-my)/vy,1/vy);
    plot(t,d,'r','Linewidth',1)
    set(gca,'LineWidth',1.1)
    set(gca,'FontSize',14)
    xlhand = get(gca,'title')
    set(xlhand,'string','(a)','fontsize',14)


if j==length(index1)

    xlhand = get(gca,'xlabel')
    set(xlhand,'string','y','fontsize',14)
    
    xlhand = get(gca,'ylabel')
    set(xlhand,'string','f(y|x)','fontsize',14)
    set(gca,'ytick',[0,1])


end

end



load illustrativeJ_MSB_n150

n=150; my=mean(yy(1:n)); vy=sqrt(var(yy(1:n)));


for j=1:2
  
    subplot(2,3,2+3*(j-1))
   % --- plot estimate --- %
    plot(t,pdfInt(4,:,j),'--','Color','k','Linewidth',1)
    hold
    plot(t,pdfInt(5,:,j),'--','Color','k','Linewidth',1)
    plot(t,pdfInt(2,:,j),'Color','k','Linewidth',1)
    set(gca,'LineWidth',1.1)
        xlim([-4,4])

    p=abs(eta(index1(j)));
    % --- plot true density --- %
    d=p*normpdf(t,(2-my)/vy,1/vy)+(1-p)*normpdf(t,(-2-my)/vy,1/vy);
    plot(t,d,'r','Linewidth',1)
    set(gca,'LineWidth',1.1)
    set(gca,'FontSize',14)
        if j==1 lim=.9;
    else if j==2 lim=.6; end 
        end

    ylim([0,lim])
    set(gca,'ytick',[0,lim])
    
    xlhand = get(gca,'title')
    set(xlhand,'string','(b)','fontsize',14)


end



load illustrativeJ_MSB_n200

n=200; my=mean(yy(1:n)); vy=sqrt(var(yy(1:n)));
set(0,'DefaultAxesFontName','Arial','DefaultAxesFontSize',14)

for j=1:2
  subplot(2,3,3+3*(j-1))

    plot(t,pdfInt(4,:,j),'--','Color','k','Linewidth',1)
    hold
    plot(t,pdfInt(5,:,j),'--','Color','k','Linewidth',1)
    plot(t,pdfInt(2,:,j),'Color','k','Linewidth',1)
    set(gca,'LineWidth',1.1)
        xlim([-4,4])
    lim=1;
        if j==1 lim=.9;
    else if j==2 lim=.6; end 
        end
    ylim([0,lim])
    set(gca,'ytick',[0,lim])
    
    p=abs(eta(index1(j)));
    d=p*normpdf(t,(2-my)/vy,1/vy)+(1-p)*normpdf(t,(-2-my)/vy,1/vy);
    plot(t,d,'r','Linewidth',1)
set(gca,'FontSize',14)

xlhand = get(gca,'title')
set(xlhand,'string','(c)','fontsize',14)


end


