function [cutCube,oldCube] = cut(Acrop,cropOld)
%Function to Cut data into only interestin Regions
[loc,pks]=findpeaks(cropOld,'MinPeakHeight',400,'MinPeakDistance',200);%WIDTH
%Finds the large peaks in the regions
cutCube=[];
oldCube=[];
for i=1:length(pks)
   eval(['cutCube.A' int2str(i) '=Acrop(:,:,pks(i)-140:pks(i)+140)']); 
   eval(['oldCube.A' int2str(i) '=cropOld(pks(i)-140:pks(i)+140)']); 

   
end

end