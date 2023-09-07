function [A , l] = finalvalues(lvalues , Avalues)
%Αθηνά Νικολάου
%vriskoume lysh pou antistoixei se l 
%pou einai pio konta sthn monada kai
%epilegoyme thn megalyterh timh toy A1
    [~ ,k] = min(abs(lvalues-1));
    l = lvalues(k);
    A(1) = Avalues(k);
    A(2) = A(1)/l;
end    