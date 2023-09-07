function [m,e,L] = provolhektrophmhkos(A,R1,R2)
%Σοφία Ξυδιά , Σταυρούλα Παπαγεωργίου
%ypologizoume provolh, ektroph kai mhkos
    R = [R1 , R2];
    L = zeros(1,2);
    m = zeros(1,2);
    e = zeros(1,2);
    for i = [1,2]
        L(i) = A(i)^2/R(i);
        m(i) = 0.49766*L(i);
        e(i) = L(i)^2/(24.151*R(i));
    end
end



    