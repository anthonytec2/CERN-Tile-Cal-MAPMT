function [ dataPeaks ] = datatoPeaks( data, oldData, shar )
[loc pks]=findpeaks(oldData,'MinPeakHeight',600,'MinPeakDistance',6);% find all the peaks in the data
dataPeaks=zeros(length(squeeze(shar(1,1,:))),length(oldData));
for i=1:length(squeeze(shar(1,1,:)))
    [row col]=find(shar(:,:,i)>0);
    sumC=0;
    for j=1:length(row)
        sumC=sumC+shar(row(j),col(j),i).*(data(row(j),col(j),pks(i)-2:pks(i)+2));
    end
    dataPeaks(i,pks(i)-2:pks(i)+2)=sumC;
end

end
