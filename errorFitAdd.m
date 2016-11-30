load('Data/cs10280.mat')
data=cutCube.A2;
oldData=oldCube.A2;
amp=30:5:100;

for i=1:length(amp)
    i
[ dataGuass,sumA] = fitAdd( data,oldData,amp(i));
sumA=sumA.*(max(oldData)/max(sumA));
error(i)=sqrt(sum((sumA-oldData).^2));
end