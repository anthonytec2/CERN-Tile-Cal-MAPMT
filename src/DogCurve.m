%Script to take two measurments and measure the differences 
load('Data/cs10278.mat')
thresh=(1:100)./100;%Range of threshold values to test different sums of the pixel data
for i=1:length(thresh)
    [sumB(i,:)]=plotSinglePixelPeaks(cpp.p2,oldCube.A2,cutCube.A2,thresh(i) );
%Creates adaptive sum for various threshold ranges of values on cpp
end
load('Data/cs10280.mat')
for i=1:length(thresh)
    [sumA(i,:)]=plotSinglePixelPeaks(cpp.p2,oldCube.A2,cutCube.A2,thresh(i) );
%Creates adaptive sum for various threshold ranges of values on cpp

end
intOne=sum(sumB,2)./length(oldCube.A2);
intTwo=sum(sumA,2)./length(oldCube.A2);
%Integral of the two data sets normilizaed with the lengths
for i=1:length(thresh)
  error(i)=100*((2*(intOne(i)-intTwo(i)))/(intOne(i)+intTwo(i)));%Get Error Ratios for each of the integral values
end
thresh=thresh(~(isnan(error)));%Take out any NAN
error=error(~(isnan(error)));%Take out any NAN
figure
subplot(1,2,1)
stem(thresh,error);%Create a plot of threshold vs error in two sums
xlabel('Threshold to Include Higher is stricter')
ylabel('Error Ratio');
title('Error Curve');
smallErrorY=find(min(abs(error))==abs(error),1,'first');%Find the smallest error plot
subplot(1,2,2)
plot(sumA(smallErrorY,:));%Plot the sums for the smallest error plots
hold all
plot(sumB(smallErrorY,:));
plot(sumA(smallErrorY,:)-sumB(smallErrorY,:));%Plot the differnece for the smallest error plots
muA=mean(sumA(smallErrorY,:)-sumB(smallErrorY,:));%store mean of error

figure
xlabel('Triggers')
ylabel('ADC Counts');
title('Repea');
