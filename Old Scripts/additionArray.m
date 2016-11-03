function[loc,pks] =additionArray(data,thresh1,thresh2,width)
removalArray=[];
sumA=data(1,:);
for i=2:48
    if(sumA==8 | any(removalArray==i))
    else
    sumA=sumA+data(i,:);
    end
    
end
figure;
subplot(1,2,1);
plot(sumA);
loc1=findpeaks(sumA,'MinPeakHeight',thresh1,'MinPeakDistance',width);
findpeaks(sumA,'MinPeakHeight',thresh1,'MinPeakDistance',width);

title(['Sum of all New PMT Peaks:' int2str(length(loc1))],'fontsize',16);
set(gca,'fontsize',14)

subplot(1,2,2);
plot(data(8,:));
[loc pks]=findpeaks(data(8,:),'MinPeakHeight',thresh2);
findpeaks(data(8,:),'MinPeakHeight',thresh2);

title(['Old PMT, Peaks:' int2str(length(loc))],'fontsize',16);
set(gca,'fontsize',14)
end