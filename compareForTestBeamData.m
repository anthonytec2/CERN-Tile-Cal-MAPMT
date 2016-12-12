figure
load('Data/cs10374.mat')
%LG
subplot(1,2,1);
customOverlay(cpp.p2,oldCube.A2,cutCube.A2);
load('Data/cs10376.mat')
%Air Gap
subplot(1,2,2);
customOverlay(cpp.p2,oldCube.A2,cutCube.A2);
load('Data/cs10378.mat')
%Switch
%subplot(2,2,3);
%customOverlay(cpp.p2,oldCube.A2,cutCube.A2);