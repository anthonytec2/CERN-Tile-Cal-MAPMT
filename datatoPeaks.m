function [ dataPeaks ] = datatoPeaks( data, oldData, shar )
%Functions that takes the sharing matrix(normilization factor) and
%convets data to a function of peaks rather than pixels
%data would be the (X,Y,Trigger) and one of the cut regions i.e. A2
%oldData would be the (X,Y,Trigger) and one of the cut regions 
%Shar is a normilization matrix (X,Y,Pk#) Where each pixel had a
%normilization factor for each single anode PMT Peak
[loc pks]=findpeaks(oldData,'MinPeakHeight',600,'MinPeakDistance',6);% find all the peaks in the data
dataPeaks=zeros(length(squeeze(shar(1,1,:))),length(oldData));%Creates data strcuture for dataPeaks
for i=1:length(squeeze(shar(1,1,:)))
    [row col]=find(shar(:,:,i)>0);%Looks for given peak number what sharings have a value greater than 0
    sumC=0;%Intialize value for sum
    for j=1:length(row)
        sumC=sumC+shar(row(j),col(j),i).*(data(row(j),col(j),pks(i)-2:pks(i)+2));%Sum the pks in the data time series with normilization factor of sharing and add to a large pixel sum
    end
    dataPeaks(i,pks(i)-2:pks(i)+2)=sumC;%Assign total sum to the dataPeaks value
end

end
