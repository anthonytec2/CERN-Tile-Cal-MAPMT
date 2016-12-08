function [sharing] = sharingNorma( data, oldData, cpp )
%data(X,Y,Triggers) oldData(X,Y,Triggers) cpp(X,Y,Pks)
%Function to create a sharing normilization matrix 
%Sharing is a X,Y,Pks matrix and contains the value (A(i,j,1)/sum(:,:,1))
%Basically a sum over all max ampltiudes of each pixel during a peak
%These are added togther and used to normalize indvidual peak amplitudes
sharing=cpp*0;
[loc pks]=findpeaks(oldData,'MinPeakHeight',600,'MinPeakDistance',6);% find all the peaks in the data
for i=1:length(squeeze(cpp(1,1,:)))
    [row col]=find(cpp(:,:,i)>0);
    sumC=0;
    for j=1:length(row)
        sumC=sumC+max(data(row(j),col(j),pks(i)-2:pks(i)+2));
    end
    for j=1:length(row)
        sharing(row(j),col(j),i)=max(data(row(j),col(j),pks(i)-2:pks(i)+2))/sumC;
    end
end


end

