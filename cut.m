function [cutCube,oldCube] = cut(Acrop,cropOld)
%Function to Cut data into only interestin Regions
[loc,pks]=findpeaks(cropOld,'MinPeakHeight',400,'MinPeakDistance',200);%WIDTH
%Finds the large peaks in the regions
%THESE HARDCODED VALUES ABOVE ARE TO DETERMINE PEAK LOCATIONS
%MAY NEED TO CHANGE FOR DIFFERENT CASES
cutCube=[];
oldCube=[];
for i=1:length(pks)
   eval(['cutCube.A' int2str(i) '=Acrop(:,:,pks(i)-140:pks(i)+140)']); 
   eval(['oldCube.A' int2str(i) '=cropOld(pks(i)-140:pks(i)+140)']); 
%ABOVE ARE CROPPED ELEMENTS OF DATA CUBE FOR A GIVEN PEAK
%data is stored in stucture of cutCube.A1,2,3,4 for each cut region
%Cut reguin cuts before and after by 140 triggers
%THIS VALUE MAY NEED TO BE CHANGED BASED ON data
   
end

end