function ektypwsh(A,R1,R2,e,m,writefile)
%Σπύρος Νικολάου
%apothhkeyoume ta dedomena stoixismena
%se ena arxeio .res
    R = [R1,R2];
    fid = fopen(writefile, 'w');
    fprintf(fid,'       R               A                e              m \n');
    for i = [1 ,2]
        fprintf(fid,' %d     %0.3f         %0.3f          %0.3f         %0.3f \n',i,R(i),A(i),e(i),m(i) );
    end
    fclose(fid);
end
