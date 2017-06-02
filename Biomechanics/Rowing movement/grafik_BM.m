function grafik_BM (i,T,A,Gt)
figure ('Name','3_1610_A','NumberTitle','off')
    subplot(3,1,1);line(T(1:(i-1)),A(1:(i-1),1),'marker','.','color','black');
    title('Grafik Akselerasi Linier - 1');
    subplot(3,1,2);line(T(1:(i-1)),A(1:(i-1),2),'marker','.','color','red');
    ylabel('Akselerasi (m/s2)');
    subplot(3,1,3);line(T(1:(i-1)),A(1:(i-1),3),'marker','.','color','blue');
    xlabel('Waktu (s)');
    saveas(gcf,'3_1610_A','fig');
    saveas(gcf,'3_1610_A','jpg');
    
figure ('Name','3_1610_Gt','NumberTitle','off')
    subplot(3,1,1);line(T(1:(i-1)),Gt(1:(i-1),1),'marker','.','color','black');
    title('Grafik Kecepatan Sudut - 1');
    subplot(3,1,2);line(T(1:(i-1)),Gt(1:(i-1),2),'marker','.','color','red');
    ylabel('Kecepatan Sudut (sudut/s)');
    subplot(3,1,3);line(T(1:(i-1)),Gt(1:(i-1),3),'marker','.','color','blue');
    xlabel('Waktu (s)');
    saveas(gcf,'3_1610_Gt','fig');
    saveas(gcf,'3_1610_Gt','jpg');
end