

load('Data/cs10320.mat');
sharing=sharingNorma(cutCube.A2,oldCube.A2,cpp.p2);
dataPeaks=datatoPeaks(cutCube.A2,oldCube.A2,sharing);
figure
for i=1:length(dataPeaks(:,1))
    plot(dataPeaks(i,:));
    hold all
end
plot(oldCube.A2)
xlabel('Triggers')
ylabel('ADC Counts')
title('320: Data Reduction from 64 Channels to only 16 function fo the peak');
set(gca,'fontsize',15);
