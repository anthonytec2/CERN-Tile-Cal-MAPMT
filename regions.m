function [cutReg]= regions(data)
[loc, pks]=findpeaks(data,'MinPeakHeight',700,'MinPeakDistance',6);% find all the peaks in the data
cutReg{1}=1:pks(1)-5;
for i=1:length(pks)-1
    
    cutReg{i+1}=(pks(i+1)-5):(pks(i+1)-5);

end
cutReg{length(pks)+1}=pks(end):length(data);

end