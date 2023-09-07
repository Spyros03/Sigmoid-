function grafhma(L,A,m,e,R1,R2,writefile)
%Σπύρος Νικολάου
%sxediash klwthoeidwn kampylwn kai kyklwn
    %klwthoeidhs 1
    S1 = 0:10:L(1);
    X1 = -(S1 - (S1.^5./(40.*A(1).^4)) - (S1.^9./(3456.*A(1).^8)));
    Y1 = (S1.^3./(6*A(1)^2)) - (S1.^7./(40.*A(1).^6)) + (S1.^11./(42240.*A(1).^10));

   
    %klwthoeidhs 2
    S2 = 0:10:L(2);
    X2 = (S2 - (S2.^5./(40*A(2).^4)) - (S2.^9./(3456.*A(2).^8)));
    Y2 = -((S2.^3./(6.*A(2).^2)) - (S2.^7./(40.*A(2).^6)) + (S2.^11/(42240.*A(2).^10)));
    
    %circle 1
    xc1 = -R1-m(1):1:R1-m(1);
    yc1pos = sqrt(R1.^2-(xc1+m(1)).^2) + (R1+e(1)) ;
    yc1neg = -sqrt(R1.^2-(xc1+m(1)).^2) + (R1+e(1));
    
    
    %circle 2
    
    xc2 = -R2+m(2):1:R2+m(2);
    yc2pos = sqrt(R2.^2-(xc2-m(2)).^2) - (R2+e(2));
    yc2neg = -sqrt(R2.^2-(xc2-m(2)).^2) - (R2+e(2));

    temp = length(writefile);
   

    figure(1) 
    axis equal;
    hold on;
    plot(xc1,yc1pos,'LineStyle','--','Color','r')
    plot(xc1,yc1neg,'LineStyle','--','Color','r')
    plot(xc2,yc2pos,'LineStyle','--','Color','m')
    plot(xc2,yc2neg,'LineStyle','--','Color','m')
    plot(X1,Y1,'r','LineWidth',2)
    plot(X2,Y2,'m','LineWidth',2)
    title('sigmoeidhs kampylh','FontSize',16)
    xlabel('aksonas x','FontSize',12)
    ylabel('aksonas y','FontSize',12)
    grid on
    print([writefile(1:(temp - 4)) '.jpg'], '-djpeg')
    
end