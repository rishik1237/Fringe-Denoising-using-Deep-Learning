clc
clear all
close all
rng(0,'twister');


N = 2*256;
M = 2*256;

a = 0.5;
b = 0.9;
r = (b-a).*rand(2,1) + a;

numOfSamples = 5;
% You can chose indx = 1,2,3,7,9,11
indx = [1,2,3,9,7,11];

for i = 1:1:numOfSamples
    
%     r = (b-a).*rand(2,1) + a;
    phi =  0.2*phasePattern(9,N/2,N/2,20,20) + 0.4*phasePattern(7,N/2,N/2,0,0) +  0.6*phasePattern(3,N/2,N/2,0,20);
% indx(randi(length(indx)))
% Fringe model: 
    I = 4 - 4*cos(phi);
    
    imagesc(I); colormap gray; 
    set(gca,'XTick',[]) % Remove the ticks in the x axis!
    set(gca,'YTick',[]) % Remove the ticks in the y axis
    set(gca,'Position',[0 0 1 1]) % Make the axes occupy the hole figure
    baseFileName = sprintf('./dataset/clean/cleanImage#%d.png', i);
    saveas(gcf,baseFileName,'png')

% fringe simulation with speckle/multiplicative noise
    maskWidth = 0.9; % 0 - 1.
    I_speckle = funcFringeSpeckleNoise(phi,maskWidth);
    
    imagesc(I_speckle); colormap gray 
    set(gca,'XTick',[]) % Remove the ticks in the x axis!
    set(gca,'YTick',[]) % Remove the ticks in the y axis
    set(gca,'Position',[0 0 1 1]) % Make the axes occupy the hole figure
    baseFileName = sprintf('./dataset/noisy/noisyImage#%d.png', i);
    saveas(gcf,baseFileName,'png')
    
    
end