function [cpp] = peakAnalysis(data, oldData )
%Function Creates CPP which is the channels that correspond to a Peak
%find peaks is used to find peaks above mean and distance of 6 bettween
%these peaks
[loc,pks]=findpeaks(oldData,'MinPeakHeight',mean(oldData),'MinPeakDistance',6);

cpp=zeros(8,8,length(pks));
%Loop over Peaks of old Data Cube
%Loop through j,k pixels
%Loop through Peaks found in New Data
%Compare Peak Positions to find if the peaks is in the range
%Set the Amplitude of that Peak Component to the ratio of the new/old
for i=1:length(pks)
   for j=1:8
      for k=1:8
        [locD pksD]=findpeaks(squeeze(data(k,j,:)),'MinPeakHeight',mean(squeeze(data(k,j,:))),'MinPeakDistance',6);  
        for z=1:length(pksD)
           if(pks(i)-5<pksD(z)&&pksD(z)<pks(i)+5) 
            cpp(j,k,i)=locD(z)/loc(i);
        end
      end
       
   end
    
end

end

