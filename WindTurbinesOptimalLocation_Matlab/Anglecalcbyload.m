RL1=RANGEL;
for i=1:41
    RL(i,1)=RANGEL(i,1);
    RL(i,2)=RANGEL(i+41,2)
    RL(i,3)=RANGEL(i+82,3)
    RL(i,4)=RANGEL(i+123,4)
    RL(i,5)=RANGEL(i+164,5)
    RL(i,6)=RANGEL(i+205,6)
    RL(i,7)=RANGEL(i+246,7)
    RL(i,8)=RANGEL(i+287,8)
    RL(i,9)=RANGEL(i+328,9)
end   
K=size(RL);
RANGEEEEE=[];
x=linspace(0,20,41);  
for k=1:K(2)
    for i=2:K(1)
        disp(i);
        if RL(i,k)-RL(i-1,k)<20
            RANGEEEEE=[RANGEEEEE x(i)];
            break;
        end
    end
end
disp(RANGEEEEE)