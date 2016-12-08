clear all
close all
%90
%92
%94 Shift 5-10 Degree right
%96 Shift 5-10 Degree left
%PLOT SCRIPT TO HIGHLIGHT 4 Different Results in a 2 by 2 plot
load('Data/cs10290.mat')%Loads in Data
subplot(2,2,2)
plotSinglePixelPeaks(cpp.p2,oldCube.A2,cutCube.A2,.4);%Plots the Single Peaks of given cutCube Data above ratio of 0.4 in CPP
title('Slow Speed')%Titles graph
clear all%Repeating this procedure for all single pixels
load('Data/cs10292.mat')
subplot(2,2,3)
plotSinglePixelPeaks(cpp.p2,oldCube.A2,cutCube.A2,.4);
title('Reporduability')
clear all

load('Data/cs10294.mat')
subplot(2,2,4)
plotSinglePixelPeaks(cpp.p2,oldCube.A2,cutCube.A2);
title('Shift Right')
clear all
load('Data/cs10296.mat')
subplot(2,2,1)
plotSinglePixelPeaks(cpp.p2,oldCube.A2,cutCube.A2);
title('Shift Left')
clear all

figure

load('Data/cs10290.mat')%Does a custom overlay of maximal amplitude pixels and single anode PMT
subplot(2,2,2)
customOverlay(cpp.p2,oldCube.A2,cutCube.A2);
title('Slow Speed')
clear all

load('Data/cs10292.mat')
subplot(2,2,3)
customOverlay(cpp.p2,oldCube.A2,cutCube.A2);
title('Reporduability')
clear all

load('Data/cs10294.mat')
subplot(2,2,4)
customOverlay(cpp.p2,oldCube.A2,cutCube.A2);
title('Shift Right')
clear all 
load('Data/cs10296.mat')
subplot(2,2,1)
customOverlay(cpp.p2,oldCube.A2,cutCube.A2);
title('Shift Left')
clear all


