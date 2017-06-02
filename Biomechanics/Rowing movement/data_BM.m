% -------------------------------------------------------------------
    clear; clc; close all;
% -------------------------------------------------------------------
% BACA DATA WIIMOTE
    kalt='kal.xlsx';
    data1='dayungicut.xlsx';
% nilai kalibrasi -> nilai rata-rata unit G0X, G0Y, G0Z 
    calt = xlsread(kalt,'E2:G1001');
    Acalt = [mean(calt(:,1)) mean(calt(:,2)) mean(calt(:,1))];

% Waktu dalam "detik"
    T = xlsread(data1,'A2:A1001')/1000;
    At = xlsread(data1,'E2:G1001');
    
    A=zeros(length(At),3);
    for i=1:length(At)
        for j=1:3
            A(i,j) = (At(i,j)- Acalt(1,j));
        end
    end
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
% i=51:350;
i=108:208;
T1 = T(i,:);
A1 = A(i,:);
V1=zeros(length(T1),3);
S1=zeros(length(T1),3);
for t=1:length(T1)-1
    for col=1:3
       V1(t+1,col)=trapz(T1(1:t+1),A1(1:t+1,col));
    end
end
for t=1:length(T1)-1
    for col=1:3
       S1(t+1,col)=trapz(T1(1:t+1),V1(1:t+1,col));
    end
end
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
% figure ('Name','Dayung_A','NumberTitle','off')
%     subplot(3,1,1);line(T(1:(i-1)),A(1:(i-1),1),'marker','.','color','black');
%     title('Grafik Akselerasi Linier - 1');
%     subplot(3,1,2);line(T(1:(i-1)),A(1:(i-1),2),'marker','.','color','red');
%     ylabel('Akselerasi (m/s2)');
%     subplot(3,1,3);line(T(1:(i-1)),A(1:(i-1),3),'marker','.','color','blue');
%     xlabel('Waktu (s)');
%     saveas(gcf,'Dayung_A','fig');
%     saveas(gcf,'Dayung_A','jpg');
% -------------------------------------------------------------------------