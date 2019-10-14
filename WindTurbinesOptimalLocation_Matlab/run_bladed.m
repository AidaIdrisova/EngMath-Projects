%a is for longitudial distance between mills, b is horizontal distance(only
%positive,w is angle
amin=160;amax=600;astep=40;
numa=fix((amax-amin)/astep)+1;
bmin=0;bmax=80;bstep=20;
numb=fix((bmax-bmin)/bstep)+1;
wmin=0;wmax=90;wstep=10;
numw=fix((wmax-wmin)/wstep)+1;
RANGEP=ones([numa,numb,numw]);
RANGEL=ones([numa,numb,numw]);
RANGEW=ones([numa,numb,numw]);
x1=0;x2=0;x3=0;
for w=wmin:wstep:wmax
    x1=0;
    x3=x3+1;
    for a=amin:astep:amax
        x1=x1+1;
        x2=0;
        for b=bmin:bstep:bmax
            x2=x2+1;
            disp(a);
            disp(b);
            disp(w);
            ChangeInput(a,b,w)
            system('dtbladed.exe DTBLADED.IN');
            fileL=fopen('C:\Program Files (x86)\DNV GL\Bladed 4.6 Educational\results\test.%15','r+');%Blade 1 load mx
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
            RANGEL(x2,x1,x3)= AL;
            fclose(fileL);
            fileP=fopen('C:\Program Files (x86)\DNV GL\Bladed 4.6 Educational\results\test.%04','r+'); %power
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
            RANGEP(x2,x1,x3)= AL;
            fclose(fileP);
        end
    end
end
% x=linspace(amin,amax,numa);
% y=linspace(bmin,bmax,numb);
% figure()
% contourf(x,y,RANGEP');
% colorbar;
% ylabel('Horizontal offset(m)');
% xlabel('Distance upstream(m)');
% legend('Power')
% figure();
% contourf(x,y,RANGEL');
% colorbar;
% ylabel('Horizontal offset(m)');
% xlabel('Distance upstream(m)');
% legend('Load')
