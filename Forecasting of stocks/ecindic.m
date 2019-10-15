num = xlsread('Total.xlsx');
l = size(num);
difft = zeros(l(1) - 1,l(2));
for i = 1:7
    difft(:,i) = diff(num(1:end,i));
    difft(:,i) = difft(:,i)/max(difft(:,i));
    numt(:,i) = num(:,i)/abs(max(num(:,i)));
end
Cov = corr(num);
x = linspace(2006,2016,44);
for i = 1:l(2)
    num(:,i) = num(:,1)/max(num(:,i));
end
plot(x,numt(:,1));
hold on;
plot(x,numt(:,2));
plot(x,numt(:,3));
plot(x,numt(:,4));
plot(x,numt(:,5));
plot(x,numt(:,6));
%plot(x,numt(:,7));
legend('infl.r.','CPI','RPI','Empl.rate','GDP','Production','BoP')