function runAll(filename)
filename=['Data/cs' int2str(filename) '.txt'];
[A,Acrop,old,cropOld] = importFileMat(filename, 'mapping.txt');
[cutCube,oldPks] = cut(Acrop,cropOld);

end