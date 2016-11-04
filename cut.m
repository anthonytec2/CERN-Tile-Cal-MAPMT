function [cutCube,oldCube] = cut(Acrop,cropOld)
[loc,pks]=findpeaks(cropOld,'MinPeakHeight',400,'MinPeakWidth',60);
cutCube=[];
for i=1:length(pks)
   eval(['cutCube.A' int2str(i) '=Acrop(:,:,pks(i)-70:pks(i)+70)']); 
   eval(['oldCube.A' int2str(i) '=cropOld(pks(i)-70:pks(i)+70)']); 

   
end

end