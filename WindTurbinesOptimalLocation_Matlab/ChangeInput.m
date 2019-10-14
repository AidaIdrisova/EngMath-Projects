function ChangeInput(a,b,w)
    fileID=fopen('C:\Program Files (x86)\DNV GL\Bladed 4.6 Educational\DTBLADED.IN');
    tline=fgetl(fileID);
    i=1;
    A{i} = tline;
    while ischar(tline)
        i = i+1;
        tline = fgetl(fileID);
        A{i} = tline;
    end
    w=w/180*3.14159265;
    A{640} = sprintf('DIST	 %d',a);
    A{644} = sprintf('CENTRE	 %d',b);
    A{597}= sprintf('WDIR	 %d',w);
    fclose(fileID);
    % Change cell A
    % Write cell A into txt
    fid = fopen('C:\Program Files (x86)\DNV GL\Bladed 4.6 Educational\DTBLADED.IN', 'w');
    for i = 1:numel(A)
        if A{i+1} == -1
            fprintf(fid,'%s', A{i});
            break
        else
            fprintf(fid,'%s\n', A{i});
        end
    end
    fclose(fid);
end