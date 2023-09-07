function [fullreadfile , fullwritefile]=checkfiles()
%Ισίδωρος Τσουκαλάς
%dinetai arxeio dedomenwn .dat mesw enos dialogue
%kai elegxoyme an to programma exei dikaiwma anagnwshs kai eggrafhs
    while true
            [readfile, readpath, ~] = uigetfile('.dat') ;
            if readfile == 0
                error('user canceled');
            end
            fullreadfile = fullfile(readpath,readfile);
            readFileNumber = fopen(fullreadfile,'r');
        if readFileNumber < 0
            ermsg = sprintf('Den itan dinath i anagnwsh i den yparxei to arxeio anagnosis: %s\n',readfile);
            h = msgbox (ermsg, 'Error', 'error');
            continue;
        else
            temp = length(fullreadfile);
            fullwritefile = [fullreadfile(1:(temp-4)) '.res'];
            writeFileNubmer = fopen(fullwritefile,'w');
            if writeFileNubmer < 0
                ermsg = sprintf('Den itan dinath i prosvash sto arxeio: %s\n',writefile);
                h = msgbox (ermsg, 'Error', 'error');
                fclose(readFileNumber);
                continue;
            else
                fclose(readFileNumber);
                fclose(writeFileNubmer);
                return;
            end
        end
    end
end
