%a is for longitudial distance between mills, b is horizontal distance(only
%positive,w is angle
RANGETSR=[10.6 10 8.7 8.2 8.3 8.35 8.4 8.45 8.5 8.55 8.5 8 7.6 7.4 6.7 6.3 6.2];
x=linspace(4,12,17);
RANGEPNEW=[49472.3 91241.7 110000 200000 250000 300000 420000 520000 630000 720000 950000 1100000 1260000 1430000 1670000 0.192750E+07 0.200007E+07]; 
RANGELNEW=[43982 53000 75000 105000 125000 135000 148000 170000 180000 210000 240000 280000 310000 350000 380000 440000 320000];
wmin=4;
wmax=12;wstep=0.5;
numw=fix((wmax-wmin)/wstep)+1;
RANGEL=[];
RANGEP=[];
w=10;
a=400;b=0;
x1=0;

for w=wmin:wstep:wmax
    x1=x1+1;
    tsr=RANGETSR(x1);
    ChangeInputt(a,b,w,tsr)
    system('dtbladed.exe DTBLADED.IN');
    fileL=fopen('C:\Program Files (x86)\DNV GL\Bladed 4.6 Educational\results\powprod.%15','r+');%Blade 1 load mx
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
    RANGEL=[RANGEL AL];
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
    RANGEP= [RANGEP AL];
    fclose(fileP);
end
RANGEPTOTAL=RANGEPNEW+RANGEP;
RANGELTOTAL=RANGELNEW+RANGEL;
RANGEPPERC=RANGEPTOTAL/(max(RANGEPTOTAL));
RANGELPERC=RANGELTOTAL/(max(RANGELTOTAL));
OPT=RANGEPPERC-RANGELPERC;
[M,I]=max(OPT);
disp(x(I));
