function [lvalues,Avalues] = findvalidvalues(R1,R2,D)
%Αθηνά Νικολάου , Σπύρος Νικολάου
%ypologizoume oles tis pithanes times tou syntelesth l
%kai tis pithanes parametrous A ths klwthoeidous
%kai elegxoume an exei lysh h oxi
    l = 0.67:0.01:1.5;
    n = length(l);
    c = -(D^2 + D*2*R1 + D*2*R2);
    k = 24.151;
    m = 0.49766;
    j = 1;
    lvalues = [];
    for  i = 1:n
        a = 1./(k.^2.*R1.^6) + 2./(k.^2.*R1.^3.*R2.^3.*l(i).^4) + 1./(k.^2.*R2.^6.*l(i).^8);
        b = 2./(k.*R1.^2) + 2.*R1./(k.*R2.^3.*l(i).^4) + 2.*R2/(k.*R1.^3) + 2./(k.*R2.^2.*l(i).^4) + ...
            m.^2./R1.^2 + 2.*m.^2./(R1.*R2.*l(i).^2) + m^2./ (R2.^2.*l(i).^4) ;
        D = discriminant(a,b,c);
        if D >= 0
            u1 = (-b+sqrt(D))/(2.*a);
            u2 = (-b-sqrt(D))/(2.*a);
            if u1 >= 0
                A1 = u1^0.25;
                if A1 < max(R1/3 , l(i)*R2/3) || A1>min(R1,l(i)*R2)
                    A1 = -1;
                end
            else
                A1 = -1;
            end
            if u2 >=0
                A2 = u2^0.25;
                if A2 < max(R1/3 , l(i)*R2/3) || A2>min(R1,l(i)*R2)
                    A2 = -1;
                end
            else
                A2 = -1;
            end
            if max(A1,A2)>=0
                Avalues(j) = max(A1,A2);
                lvalues(j) = l(i);
                j = j+1;
            end
        end
    end
    if isempty(lvalues)
        ermsg = sprintf('Gia to sygkekrimeno arxeio dedomenwn to systhma den exei lysh');
        h = msgbox (ermsg, 'Error', 'error');
        error('')
    end
end

function D = discriminant(a,b,c)
    D = b.^2-4.*a.*c;
end
