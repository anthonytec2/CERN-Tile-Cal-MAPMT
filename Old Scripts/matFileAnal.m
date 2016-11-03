function matFileAnal(name)
load(['Data/cs' int2str(name) '.mat']);
%plotCuts(cutCube)
%figure
for i=1:length(struct2cell(cutCube))
      subplot(1,2,1)
   eval(['plot(sum(cutCube.A' int2str(i) '(1:7,:))+sum(cutCube.A' int2str(i) '(9:48,:)))']);
   
    subplot(1,2,2)
   eval(['plot(cutCube.A' int2str(i) '(8,:));']); 
  
   %thresh1=input('Threshold 1');
   %thresh2=input('Threshold 2');
   %width=input('Width')
   
    eval(['thresh1=mean(cutCube.A' int2str(i) '(8,:));']); 
    eval(['thresh2=mean(sum(cutCube.A' int2str(i) '(1:7,:))+sum(cutCube.A' int2str(i) '(9:48,:)))']); 
   width=7;

   
   
   eval(['[loc,pks] =additionArray(cutCube.A' int2str(i) ',thresh1,thresh2,width)']); 
   
   eval(['[cpp.A' int2str(i) ']=analysis(pks, cutCube.A' int2str(i) ')']);
%   figure
%   eval(['bestReconstruction(cpp,cutCube.A' int2str(i) ')']);
%   figure
%   eval(['displayAllPlot(cutCube.A' int2str(i) ')']);
%   for j=1:length(pks)
%       figure
%       eval(['plotActive(cpp,cutCube.A' int2str(i) ',j)']);
%   end
end

   save(['Data/cs' int2str(name) '.mat']);


