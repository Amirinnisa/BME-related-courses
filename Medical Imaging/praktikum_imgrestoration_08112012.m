% Praktikum 8 November 2012
% Image Restoration
% De-Blurring

RGB = imread('saturn.png');
I=rgb2gray(RGB);

% noise ditambahkan: noise gaussian
J=imnoise(I,'gaussian',0,0.005);
K=wiener2(J,[5 5]);
figure, imshow(I)
figure, imshow(J)
figure, imshow (K)

% P.S: Noise Gaussian, bagus ditangani pakai filter wiener
% Noise Salt&Pepper, pakai median filtering