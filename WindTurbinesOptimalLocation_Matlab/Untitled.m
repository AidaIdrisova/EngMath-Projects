RANGE=[];
amin=200;
amax=800;
astep=40;
bmin=0;
bmax=160;
bstep=40;
for a=amin:astep:amax
    for b=bmin:bstep:bmax
        ChangeInput(a,b)
        status=system('dtbladed.exe DTBLADED.IN');
        fileO=fopen('C:\Program Files (x86)\DNV GL\Bladed 4.6 Educational\results\powprod.%15','r+');
        tine=fgetl(fileO);
        i=1;
        B{i} = tine;
        while ischar(tine)
            i = i+1;
            tine = fgetl(fileO);
            B{i} = tine;
        end
        Char=B{60};
        AL=str2num(Char(9:21));
        RANGE=[RANGE AL];
        fclose(fileO);
    end
 end
 disp(RANGE);
 x=linspace(amin,amax,fix((amax-amin)/astep));
 y=linspace(bmin,bmax,fix((bmax-bmin)/bstep));