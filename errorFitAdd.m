amp=30:100;

for i=1:length(amp)
    i
[ dataGuass,sumA] = fitAdd( data,oldData,amp(i));
sumA=sumA.*(max(oldData)/max(data));
error(i)=sqrt(sum((sumA-oldData).^2));
end