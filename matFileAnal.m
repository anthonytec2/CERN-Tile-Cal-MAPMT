load('Data/cs10266.mat');
plotCuts(cutCube)

for i=1:length(struct2cell(cutCube))
   eval(['plot(cutCube.A' int2str(i) '(8,:));']);  
   thresh1=input('Threshold 1');
   thresh2=input('Threshold 2');
   width=input('Width')
   eval(['[loc,pks] =additionArray(cutCube.A' int2str(i) ',thresh1,thresh2,width)']); 
   eval(['[cpp]=analysis(pks, cutCube.A' int2str(i) ')']);
   eval(['bestReconstruction(cpp,cutCube.A' int2str(i) ')']);
   eval(['displayAllPlot(cutCube.A' int2str(i) ')']);
   for j=1:length(pks)
       
       eval(['plotActive(cpp,cutCube.A' int2str(i) ',j)']);
   end
end


