[num2,txt,raw] = xlsread('Facebook.xls');
t = datetime(txt(:,1),'InputFormat','dd/MM/yyyy HH:mm:ss');
Q = month(t(2:end));
Y = year(t(2:end));
Sentiments = [];
num2 = num2(:,2);
for i = 1:5
    yearr = 2017 - i;
    for k = 1:12
        l4 = sum(num2(Y == yearr & Q == k))/length(num2(Y == yearr & Q == k));
        Sentiments = [Sentiments l4];
    end
end

num = xlsread('Final.xls');
ss = size(num);
numseries = ss(2);
%Sentiments=Sentiments(end-ss(1)+1:end);
num = [num Sentiments'];
p = 4;
Mdl = varm(numseries+1,p);
EstMdl = estimate(Mdl,num);
numperiods = 4;
[PRED,YMSE] = forecast(EstMdl,numperiods,num);
AA = [num' PRED'];
ss = size(AA);
x = linspace(2006,2018,ss(2));
%x=linspace(2006,2018,48);
figure();
plot(x',AA(end-1,:));

real = [num(:,end-1)' 116.03 132.25 136.47 141.93];
hold on;
plot(x,real);
k = PRED(:,end-1);
error = immse(k',real((end-3):end));
