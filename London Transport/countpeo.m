function[]=countpeo()
Zone1=[9,10,13,17,19,20,24,29,32,46,51,62,70,77,78,79,81,83,84,86,92,97,98,115,119,126,136,138,140,141,143,146,147,151,152,153,157,172,174,177,178,182,183,190,194,202,206,210,217,218,220,230,234,235,237,246,247];
Zone2=[];
Zone3=[];
Zone4=[];
Zone5=[];
Zone6=[];
all=8:275;
needed=Zone1;
R=size(needed);
[num,txt,raw]= xlsread('entsun.xls','A7:CV275');
rawent=raw;
[num,txt,raw]= xlsread('extsun.xls','A7:CV275');
rawext=raw;
xlabel('people');
ylabel('time');
plot(100,30000);
hold on;
x=1;
for n=5:100
    yent=0;
    yext=0;
    for k=1:R(2)
        rawneed=needed(k)-6;
        yent=yent+rawent{rawneed,n};
        yext=yext+rawext{rawneed,n};
    end;
    scatter(x,yent,5,'r','filled');
    scatter(x,yext,5,'b','filled');
    x=x+1;
end;
legend('exits');