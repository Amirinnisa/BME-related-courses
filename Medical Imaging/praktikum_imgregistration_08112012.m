% Praktikum 8 November 2012
% Image Registration
% imrotate

A = imread('cameraman.tif');
B = imrotate(A,-30,'bilinear','crop');
C = imrotate(A,-30,'bilinear','loose');

figure, imshow(A)
figure, imshow(B)
figure, imshow(C)

% ------------------------------------------------------------------------
% Image Registration
% imcrop

I = imread('circuit.tif');
% imcrop (image, [xmin ymin width height])
J = imcrop(I, [60 40 100 90]);

figure, imshow(I)
figure, imshow(J)

% atau, pakai cropping tool langsung dari windownya
K = imcrop(I);
figure, imshow(K)

% -------------------------------------------------------------------------
% Image Registration
% imresize

L = imread('rice.png');
M = imresize(L, 0.5);
figure, imshow(L)
figure, imshow(M)
