I=imread('eight.tif');
J=imnoise(I, 'salt & pepper', 0.02);
figure, imshow(I)
figure, imshow(J)

% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
% median dan averaging filtering: BLURRING (termasuk low pas filtering)
% ------------------------- MEDIAN FILTERING ------------------------------
K=medfilt2(J);
figure, imshow(K)
% ------------------------- AVERAGING FILTERING ---------------------------
AF9 = ([1 1 1;1 1 1;1 1 1] * 1/9);
AF25= ([1 1 1 1 1;1 1 1 1 1;1 1 1 1 1;...
        1 1 1 1 1;1 1 1 1 1] * 1/25);
    
avg9 = uint8(conv2(double(I),AF9,'same'));
avg25 = uint8(conv2(double(I),AF25,'same'));

figure, imshow(avg9)
figure, imshow(avg25)

% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
% high pass filtering: SHARPENING
% ----------------------- HIGH PASS FILTERING -----------------------------
hpf1 = [1 -2 1; -2 5 -2; 1 -2 1];
hpf2 = [0 -1 0; -1 5 -1; 0 -1 0];
hpf3 = [-1 -1 -1; -1 9 -1; -1 -1 -1];

hp1 = uint8(conv2(double(I),hpf1,'same'));
hp2 = uint8(conv2(double(I),hpf2,'same'));
hp3 = uint8(conv2(double(I),hpf3,'same'));

figure, imshow(hp1)
figure, imshow(hp2)
figure, imshow(hp3)
