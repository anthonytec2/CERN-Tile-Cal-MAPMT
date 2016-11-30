load('Data/cs10318.mat')
data=reshape(cutCube.A2,[64,281]);
[U S V]=svd(data);
sigVals=diag(S);
sigVals(12:end)=0;
newS=S;
newS(logical(eye(size(newS))))=sigVals;
dataRed=U*newS*V';

subplot(1,2,1);
plot(data(22,:));
subplot(1,2,2)
plot(dataRed(22,:));
