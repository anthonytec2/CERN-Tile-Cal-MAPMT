%load('Data/cs10320.mat');
sharing=sharingNorma(cutCube.A2,oldCube.A2,cpp.p2);
dataPeaks=datatoPeaks(cutCube.A2,oldCube.A2,sharing);
figure
for i=1:length(dataPeaks(:,1))
    plot(dataPeaks(i,:),'linewidth',1.5);
    hold all
end
plot(oldCube.A2,'linewidth',1.5)
xlabel('Triggers')
ylabel('ADC Counts')
title('368: Data Reduction from 64 Channels to only 13 function fo the peak');
set(gca,'fontsize',15);
optFitLeastSquaresPeaks(dataPeaks,oldCube.A2) 