%load('Data/cs10320.mat');
%SCRIPT TO TAKE DATA FROM 64 Channels to # of PEAKS
%PERFORM this by making finding all peak
%Then getting back each pixels share to that peak
%After then these pixels are added togther using normilization ratio on
%total data so for example peakNumber 1=sum(Normilization*Pixel(i,j,:))
%Therefore small ampltiude pixels do not have as strong a presenece in the
%reconstruction
sharing=sharingNorma(cutCube.A2,oldCube.A2,cpp.p2);%This function returns the normlization matrix needed for the reconstruction
dataPeaks=datatoPeaks(cutCube.A2,oldCube.A2,sharing);%Performs mutiplication and summing using this normilization to return data as a function of peaks
figure%plotting scheme
for i=1:length(dataPeaks(:,1))
    plot(dataPeaks(i,:),'linewidth',3);%plots all the invidual peaks
    hold all
end
plot(oldCube.A2,'linewidth',3)%plots the old PMT
xlabel('Triggers')%Titles
ylabel('ADC Counts')
title('Data Reduction from 64 Channels to only 13 function fo the peak');
set(gca,'fontsize',24);
optFitLeastSquaresPeaks(dataPeaks,oldCube.A2) %Performs a weighted summing scheme to solve |oldCube.A2-alpha*dataPeaks(i,:)|<epsilon and plots the summed scheme