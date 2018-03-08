function[oldData, data] =getData(runNum)

load(['Data/cs' int2str(runNum) '.mat']);
oldData=oldCube.A2;
data=cutCube.A2;
end