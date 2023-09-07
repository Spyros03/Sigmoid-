function [R1, R2 ,D, error] = readinitialvalues(readfile)
%Σπύρος Νικολάου , Ισίδωρος Τσουκαλάς
%to programma diavazei ta arxeia dedomenwn .dat
%kai elegxei gia lathh syntakshs kai lathh sta dedomena
%kai krataei tis katallhles times
    error = 0;
    readfilenumber = fopen(readfile ,'r');
    readableline = 1 ;
    linecounter = 0;
    D = [];
    R1 = [];
    R2 = [];
    while true
        nextline = fgetl(readfilenumber);
        if nextline == -1
            if  linecounter == 0
                ermsg=sprintf('keno arxeio' ,linecounter,readfile);
                h = msgbox (ermsg, 'Error', 'error');
                error = 1;
                return;
            elseif  readableline == 0
                ermsg=sprintf('keno arxeio' ,linecounter,readfile);
                h = msgbox (ermsg, 'Error', 'error');
                error = 1;
                return;
            elseif  readableline < 2
                ermsg=sprintf('ta dedomena einai elleiph' ,linecounter,readfile);
                h = msgbox (ermsg, 'Error', 'error');
                error = 1;
                return;
            end
            break;
        end
        linecounter = linecounter + 1;
        if isempty(nextline)
            continue;
        end
        a = strsplit(strtrim(nextline));
       if isempty(strtrim(nextline))
          continue;
       end
        if strcmp(a{1}(1),'#')
            continue;
        elseif strcmp(a{1},'RADIUS:')
            if readableline ~= 1
                ermsg=sprintf('sthn grammh %d tou arxeiou %s ta dedomena einai dosmena me lathos seira',linecounter,readfile);
                h = msgbox (ermsg, 'Error', 'error');
                error = 1;
                return;
             end
             R1  = str2num(a{2});
             R2  = str2num(a{3});
             readableline = readableline + 1;
             if isempty(R1) || isempty(R2)
                ermsg = sprintf('Den iparxei timh tis aktinas sto arxeio %s sthn grammh &d',readfile,linecounter);
                h = msgbox (ermsg, 'Error', 'error');
                error = 1;
                return;
             end
             if R1 < 20 || R2 < 20 || ~isreal(R1) || ~isreal(R2)
                 ermsg=sprintf('sthn grammh %d tou arxeiou %s ta dedomena einai lathos(lathos aktines)',linecounter,readfile);
                 h = msgbox (ermsg, 'Error', 'error');
                 error = 1;
                 return;
             end
             continue;
        elseif strcmp(a{1},'DISTANCE:')
            if readableline ~= 2
               ermsg=sprintf('sthn grammh %d tou arxeiou %s ta dedomena einai dosmena me lathos seira',linecounter,readfile);
               h = msgbox (ermsg, 'Error', 'error');
               error = 1;
               return;
            end
                 D = str2num(a{2});
            if isempty(D)
               ermsg=sprintf('Den iparxei timh tis apostasis h uparxei lathos sto arxeio %s stin grammh %d',readfile,linecounter);
               h = msgbox (ermsg, 'Error', 'error');
               error = 1;
               return;
            end
            if D <= 0 || ~isreal(D)
               ermsg=sprintf('sthn grammh %d tou arxeiou %s ta dedomena einai lathos(arnhtikh mhdenikh h migadikh apostash)',linecounter,readfile);
               h = msgbox (ermsg, 'Error', 'error');
               error = 1;
               return;
            end
        end
        if isempty(D)
               ermsg=sprintf('Den iparxei timh tis apostasis ');
               h = msgbox (ermsg, 'Error', 'error');
               error = 1;
               return;
        end
        if isempty(R1) || isempty(R2)
                ermsg = sprintf('Den iparxei timh tis aktinas');
                h = msgbox (ermsg, 'Error', 'error');
                error = 1;
                return;
        end
    end






