function I = funcFringeSpeckleNoise(ph2D,maskWidth)
% Simulation of fringe pattern corrupted with speckle noise.
% maskWidth decided the speckle size. 

[N,M] = size(ph2D);
x = linspace(-1,1,N);
y = linspace(-1,1,M);
[X,Y] = meshgrid(x,y);
mask= zeros(N);
mask((X.^2 + Y.^2) < maskWidth.^2) = 1;
% figure; mesh(mask);
a = -pi;
b = 2*pi;
ranPh = a + b*rand(N);
% figure; imagesc(ranPh);
S1 = exp(1i*ranPh);
S1 = mask.*fftshift(fft2(S1)); 
I = ifft2(ifftshift(S1))+1;
Ib = I.*conj(I);
 
S2 = exp(1i*(ranPh+ph2D));
S2 = mask.*fftshift(fft2(S2)); 
I = ifft2(ifftshift(S2))+1;
Ia = I.*conj(I);
 
I = abs(Ia-Ib);
 

