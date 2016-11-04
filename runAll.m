function runAll(filename)
%Script to Run All Data Analysis Functions
fileNum=filename;
filename=['Data/cs' int2str(filename) '.txt'];
[A,Acrop,old,cropOld] = importFileMat(filename, 'mapping.txt');
[cutCube,oldCube] = cut(Acrop,cropOld);
for i=1:length(struct2cell(cutCube))
    eval(['[cpp.p' int2str(i) '] = peakAnalysis(cutCube.A' int2str(i) ', oldCube.A' int2str(i) ' );']);
   % eval(['bestReconstruction(cpp.p' int2str(i) ', oldCube.A' int2str(i) ', cutCube.A' int2str(i)  ' )']);
end
save(['Data/cs' int2str(fileNum) '.mat']);
end