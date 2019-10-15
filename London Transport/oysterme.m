function[sheet]=oysterme()
[num,txt,raw]= xlsread('howneedold.xls','A3:J34165');
ready=raw;
for n=5:10
    for k=1:34160
        ready{k+2,n}=0;
    end;
end;
[num,txt,raw]= xlsread('oyster.csv','A2:H307097');
sheet=0;
for n=2:307095
    if raw{n,1}=='Mon'
        rawneeded=0;colneeded=0;
        %need to know raw
        for l=3:34163
            if strncmp(raw{n,3},ready{l,2},4) && strncmp(raw{n,4},ready{l,4},4)
                rawneeded=l;
                break;
            end;
        end;
        %need to know col
        time=raw{n,5}/60;
        if time<7
            colneeded=5;
        end;
        if time>16 && time<19
            colneeded=7;
        end;
        if time>19 && time<22
            colneeded=8;
        end;
        if time>22
            colneeded=9;
        end;
        if rawneeded~=0 && colneeded~=0
            ready{rawneeded,colneeded}=ready{rawneeded,colneeded}+1;
            ready{rawneeded,10}=ready{rawneeded,10}+1;
        else
            sheet=sheet+1;
        end;
    end;
end;
xlswrite('tadam.xls',ready);