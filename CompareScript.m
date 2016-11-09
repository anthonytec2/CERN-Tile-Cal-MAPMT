clear all
close all
load('Data/cs10288.mat')
subplot(2,2,1)
plotSinglePixelPeaks(cpp.p2,oldCube.A2,cutCube.A2);
title('10288')
clear all
load('Data/cs10290.mat')
subplot(2,2,2)
plotSinglePixelPeaks(cpp.p2,oldCube.A2,cutCube.A2);
title('10290')
clear all
load('Data/cs10292.mat')
subplot(2,2,3)
plotSinglePixelPeaks(cpp.p2,oldCube.A2,cutCube.A2);
title('10292')
clear all
load('Data/cs10294.mat')
subplot(2,2,4)
plotSinglePixelPeaks(cpp.p2,oldCube.A2,cutCube.A2);
title('10294')
clear all


%{
figure
load('Data/cs10288.mat')
subplot(2,2,1)
customOverlay(cpp.p2,oldCube.A2,cutCube.A2);
title('10288')
clear all
load('Data/cs10290.mat')
subplot(2,2,2)
customOverlay(cpp.p2,oldCube.A2,cutCube.A2);
title('10290')
clear all

load('Data/cs10292.mat')
subplot(2,2,3)
customOverlay(cpp.p2,oldCube.A2,cutCube.A2);
title('10292')
clear all

load('Data/cs10294.mat')
subplot(2,2,4)
customOverlay(cpp.p2,oldCube.A2,cutCube.A2);
title('10294')
clear all 
%}


