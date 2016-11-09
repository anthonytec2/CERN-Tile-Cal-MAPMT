load('Data/cs10290.mat')
thresh=(1:100)./100;
for i=1:length(thresh)
    [sumB(i,:)]=plotSinglePixelPeaks(cpp.p2,oldCube.A2,cutCube.A2,thresh(i) );
end
load('Data/cs10292.mat')
for i=1:length(thresh)
    [sumA(i,:)]=plotSinglePixelPeaks(cpp.p2,oldCube.A2,cutCube.A2,thresh(i) );
end
intOne=sum(sumB,2)./length(oldCube.A2);
intTwo=sum(sumA,2)./length(oldCube.A2);

for i=1:length(thresh)
  error(i)=100*((2*(intOne(i)-intTwo(i)))/(intOne(i)+intTwo(i)));
end
thresh=thresh(~(isnan(error)));
error=error(~(isnan(error)));
figure
stem(thresh,error);
xlabel('Threshold to Include Higher is stricter')
ylabel('Error Ratio');
title('Error Curve');
smallErrorY=find(min(abs(error))==abs(error),1,'first');
figure
plot(sumA(smallErrorY,:));
hold all
plot(sumB(smallErrorY,:));
plot(sumA(smallErrorY,:)-sumB(smallErrorY,:));
muA=mean(sumA(smallErrorY,:)-sumB(smallErrorY,:));
