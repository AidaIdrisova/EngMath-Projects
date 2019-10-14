%a is for longitudial distance between mills, b is horizontal distance(only
%positive,w is angle
amin=160;amax=500;astep=40;
numa=fix((amax-amin)/astep)+1;
bmin=0;bmax=120;bstep=10;
numb=fix((bmax-bmin)/bstep)+1;
wmin=4;wmax=12;wstep=0.5;
numw=fix((wmax-wmin)/wstep)+1;
RANGEP=ones([numa,numb]);
RANGEL=ones([numa,numb]);
RANGEW=ones([numa,numb]);
RANGEX=[];
RANGEY=[];
x1=0;x2=0;x3=0;
w=4.5;
for a=amin:astep:amax
    x1=x1+1;
    x2=0;
    for b=bmin:bstep:bmax
        x2=x2+1;
        disp(a);
        disp(b);
        disp(w);
        ChangeInputt(a,b,w)
        system('dtbladed.exe DTBLADED.IN');
        fileL=fopen('C:\Program Files (x86)\DNV GL\Bladed 4.6 Educational\results\powprod.%15','r+');%Blade 1 load mx
        %fileO=fopen('C:\Program Files (x86)\DNV GL\Bladed 4.6 Educational\results\test.%14','r+'); 
        tine=fgetl(fileL);
        i=1;
        B{i} = tine;
        while ischar(tine)
            i = i+1;
            tine = fgetl(fileL);
            B{i} = tine;
        end
        Char=B{23}; %blade 1 load 
        AL=str2num(Char(11:23));% blade 1 load
        RANGEL(x1,x2)= AL;
        disp(AL)
        fclose(fileL);
        fileP=fopen('C:\Program Files (x86)\DNV GL\Bladed 4.6 Educational\results\powprod.%04','r+'); %power
        tine=fgetl(fileP);
        i=1;
        B{i} = tine;
        while ischar(tine)
            i = i+1;
            tine = fgetl(fileP);
            B{i} = tine;
        end
        Char=B{39};% power
        AL=str2num(Char(40:51)); %power
        %Char=B{41}; 
        %AL=str2num(Char(11:23)); 
        RANGEP(x1,x2)= AL;
        fclose(fileP);
        fileW=fopen('C:\Program Files (x86)\DNV GL\Bladed 4.6 Educational\results\powprod.%14','r+'); 
        tine=fgetl(fileW);
        i=1;
        B{i} = tine;
        while ischar(tine)
            i = i+1;
            tine = fgetl(fileW);
            B{i} = tine;
        end
        Char=B{41}; 
        AL=str2num(Char(11:23)); 
        RANGEW(x1,x2)= AL;
        fclose(fileP);
    end
end
A=RANGEP;
A=A/(max(max(A)));
B=RANGEL;
B=B/(max(max(B)));
OPT=A-B;
[M,I]=max(OPT);
[L,Y]=max(M);
Z=find(M==L);
x=linspace(amin,amax,numa);
y=linspace(bmin,bmax,numb);
besty=y(Y);
bestx=x(I(Z));
disp(besty);
disp(bestx);
% RANGEX=[RANGEX bestx];
% RANGEY=[RANGEY besty];
% ww=linspace(wmin,wmax,numw);
% plot(ww,RANGEX);
% hold on;
% plot(ww,RANGEY);
% legend('optimal x','optimal y');
% x=linspace(amin,amax,numa);
% y=linspace(bmin,bmax,numb);
% figure()
% contourf(x,y,RANGEP');
% colorbar;
% ylabel('Horizontal offset(m)');
% xlabel('Distance upstream(m)');
% legend('Power(W)')
% figure();
% contourf(x,y,RANGEL');
% colorbar;
% ylabel('Horizontal offset(m)');
% xlabel('Distance upstream(m)');
% legend('Load(N)')
% figure();
% contourf(x,y,RANGEW');
% colorbar;
% ylabel('Horizontal offset(m)');
% xlabel('Distance upstream(m)');
% legend('Wind(m/s)')
% f = fopen('results.txt','w');
% fprintf('Load\n');
% for row = 1 : size(RANGEL, 1)
% 	fprintf(f, '%d %d %d\n', ...
% 		row, RANGEL(row, 1), RANGEL(row, 2), RANGEL(row, 3), RANGEL(row, 4), RANGEL(row, 5))
% end
% f.close()
