load('Data/cs10318.mat')
data=reshape(cutCube.A2,[64,281]);
[U S V]=svd(data);
sigVals=diag(S);
sigVals(
newS=S;
newS(logical(eye(size(newS))))=sigVals;