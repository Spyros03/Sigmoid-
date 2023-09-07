clear; clc; close all;
%Αθηνά Νικολάου
%kaloume tis synartiseis kai typwnoume oti
%ta zhtoumena upologistikan epitixws
disp('Σχεδιασμός σιγμοειδούς καμπύλης - ακαδημαϊκό έτος 2022/2023 - ομάδα 2 - Αθηνά Νικολάου , Σπύρος Νικολάου , Σοφία Ξυδιά , Σταυρούλα Παπαγεωργίου , Ισίδωρος Τσουκαλάς');
[readfile, writefile] = checkfiles();
[R1, R2 ,D, error ] = readinitialvalues(readfile);
if error == 1
    return;
end
[lvalues,Avalues] = findvalidvalues(R1,R2,D);
[A , l] = finalvalues(lvalues , Avalues);
[m,e,L] = provolhektrophmhkos(A,R1,R2);
ektypwsh(A,R1,R2,e,m,writefile);
grafhma(L,A,m,e,R1,R2,writefile);
fprintf('Ta zhtoumena upologistikan epitixws');
