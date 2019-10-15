function[]=zaebali()
[num,txt,raw]= xlsread('ExitsBike.xlsx','A2:J10934');
shit=raw;
[num,txt,raw]= xlsread('entbikes.xls','A1:CV270');
for n=2:10933
    %col number
    rowneeded=0;
    time=cell2mat(shit(n,3));
    e=size(time);
    if e(2)>16
        time=((time(12)-48)*10+time(13)-48)*60+(time(15)-48)*10+time(16)-48;
    else
        time=120;
    end;
    colneeded=4+ceil((time-120)/15);
    if colneeded<4
        colneeded=95+colneeded;
    end;
    fprintf('%d \n',n);
    %rowneeded
    for k=8:275
        if strncmp(shit(n,6),raw(k,2),4)
            rowneeded=k;
            break;
        end;
    end;
    if rowneeded~=0 
        raw{rowneeded,colneeded}=raw{rowneeded,colneeded}+1;
    end;
end;
xlswrite('bikedataexits.xls',raw);