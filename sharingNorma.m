function [sharing] = sharingNorma( data, oldData, cpp )
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

