clc
clear all
close all

N = 2*256;
M = 2*256;

% You can chose indx = 1,2,3,7,9,11
indx = 3;
phi = 0.5*phasePattern(indx,N/2,N/2,0,0);
%phi =  intensitypattern(6,N/2,N/2,0,0)+0.5*intensitypattern(2,N/2,N/2,0,0);
%phi = intensitypattern(1,N/2,N/2,0,0)+1*intensitypattern(11,N/2,N/2,0,0);
%phi = intensitypattern(2,N/2,N/2,0,0)+1.5*intensitypattern(7,N/2,N/2,0,0);

% Fringe model: I = a + b*cos(phi);

% fringe simulation with additive noise
a = 1; 
b = 1; 
SNR = 10; % signal-to-noise ratio
I_additive = a + b.*cos(phi);
I_additive = awgn(I_additive,SNR);
figure; imagesc(I_additive); colormap gray

% fringe simulation with speckle/multiplicative noise
maskWidth = 0.9; % 0 - 1.
I_speckle = funcFringeSpeckleNoise(phi,maskWidth);
figure; imagesc(I_speckle); colormap gray

% fringe simulation with Random phase profile
phMag = 1e-2; 
filtWidth = 0.01;
phi = funcRandomPhaseProfile(M,N,phMag,filtWidth);
I_truth = a + b.*cos(phi);
figure; imagesc(I_truth); colormap gray

maskWidth = 0.9;
I_speckle = funcFringeSpeckleNoise(phi,maskWidth);
figure; imagesc(I_speckle); colormap gray