% Praktikum 8 November 2012
% Image Reconstruction
% Radon

P = phantom(256);
figure(1);imagesc(P);colormap(hot);
colorbar;axis image;title('Citra Phantom Asal');

theta = 0:2:180;
[R,xp] = radon(P,theta);
figure(2);imagesc(theta,xp,R);colormap(hot);
colorbar;xlabel ('\theta');ylabel ('x\prime');
title('Hasil Transformasi Radon dari Citra Phantom Asal');

% -------------------------------------------------------------------------
% Image Reconstruction
% iradon -> inverse radon

I = iradon(R,2);
figure(3);imagesc(I);colormap(hot);
colorbar;axis image;title('Hasil Transformasi Radon Inverse Citra Phantom');