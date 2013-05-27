%% --- example 1

time=[10000,100000,500000,700000];

msbMSE(1)=0.18;
cartMSE(1)=0.27;
lassoMSE(1)=0.26;

msbTime(1)=5;
cartTime(1)=5;
lassoTime(1)=2;

msbstd(1)=0.26;
cartstd(1)=0.42;
lassostd(1)=0.46;

msbMSE(2)=0.43;
cartMSE(2)=0.88;
lassoMSE(2)=0.52;

msbTime(2)=7;
cartTime(2)=50;
lassoTime(2)=5;


msbstd(2)=0.59;
cartstd(2)=1.29;
lassostd(2)=0.70;

msbMSE(3)=0.003;
cartMSE(3)=0.17;
lassoMSE(3)=0.08;

msbTime(3)=10;
cartTime(3)=214;
lassoTime(3)=43;


msbstd(3)=0.16;
cartstd(3)=0.23;
lassostd(3)=0.13;

msbMSE(4)=0.69;
cartMSE(4)=1.36;
lassoMSE(4)=0.82;

msbTime(4)=13;
cartTime(4)=321;
lassoTime(4)=80;

msbstd(4)=0.94;
cartstd(4)=1.47;
lassostd(4)=1.28;

figure
errorbar(msbMSE,msbstd)
hold
errorbar(cartMSE,cartstd,'--')
errorbar(lassoMSE,lassostd,'-.')


figure
bar([msbMSE',lassoMSE',cartMSE'])

figure
bar([msbTime',lassoTime',cartTime'])


%% example 2


time=[10000,50000,100000,200000];

msbMSE(1)=1.54;
cartMSE(1)=1.78;
lassoMSE(1)=2.37;

msbMSE(2)=0.76;
cartMSE(2)=0.97;
lassoMSE(2)=1.77;

msbMSE(3)=0.77;
cartMSE(3)=1.01;
lassoMSE(3)=1.61;

msbMSE(3)=0.86;
cartMSE(3)=0.90;
lassoMSE(3)=1.41;


figure
bar([msbMSE',lassoMSE',cartMSE'])

%% table 3


% --- n=100,200,300 p=300000
clear
time=[100,200,300];

msbMSE(1)=0.26;
cartMSE(1)=0.39;
lassoMSE(1)=0.31;

msbMSE(2)=0.25;
cartMSE(2)=0.47;
lassoMSE(2)=0.26;

msbMSE(3)=0.25;
cartMSE(3)=0.30;
lassoMSE(3)=0.30;


msbTime(1)=9.28;
cartTime(1)=125;
lassoTime(1)=18;

msbTime(2)=15;
cartTime(2)=262;
lassoTime(2)=40;

msbTime(3)=15;
cartTime(3)=463;
lassoTime(3)=73;


figure
bar(time,[msbMSE',lassoMSE',cartMSE'])

figure
bar(time,[msbTime',lassoTime',cartTime'])

% ----



clear 
msbMSE(1)=0.23;
cartMSE(1)=0.42;
lassoMSE(1)=0.36;

msbMSE(2)=0.67;
cartMSE(2)=1.35;
lassoMSE(2)=1.32;

msbMSE(3)=0.26;
cartMSE(3)=0.39;
lassoMSE(3)=0.31;



msbTime(1)=5;
cartTime(1)=24;
lassoTime(1)=3;

msbTime(2)=9;
cartTime(2)=47;
lassoTime(2)=6;

msbTime(3)=9.28;
cartTime(3)=125;
lassoTime(3)=20;




figure
bar([msbMSE',lassoMSE',cartMSE'])

figure
bar([msbTime',lassoTime',cartTime'])


%% -- table 4


clear 
msbMSE(1)=0.25;
cartMSE(1)=0.46;
lassoMSE(1)=0.38;



msbMSE(2)=0.24;
cartMSE(2)=0.43;
lassoMSE(2)=0.25;


msbMSE(3)=0.25;
cartMSE(3)=0.78;
lassoMSE(3)=0.33;


msbMSE(4)=0.17;
cartMSE(4)=0.33;
lassoMSE(4)=0.19

msbTime(1)=5;
cartTime(1)=5;
lassoTime(1)=1;

msbTime(2)=6;
cartTime(2)=48;
lassoTime(2)=7;

msbTime(3)=6;
cartTime(3)=96;
lassoTime(3)=13;

msbTime(4)=11;
cartTime(4)=230;
lassoTime(4)=30;



figure
bar([msbMSE',lassoMSE',cartMSE'])

figure
bar([msbTime',lassoTime',cartTime'])




