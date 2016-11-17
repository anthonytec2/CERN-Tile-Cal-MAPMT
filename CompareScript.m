clear all
close all
%90
%92
%94 Shift 5-10 Degree right
%96 Shift 5-10 Degree left

load('Data/cs10290.mat')
subplot(2,2,2)
plotSinglePixelPeaks(cpp.p2,oldCube.A2,cutCube.A2,.4);
title('Slow Speed')
clear all
load('Data/cs10292.mat')
subplot(2,2,3)
plotSinglePixelPeaks(cpp.p2,oldCube.A2,cutCube.A2,.4);
title('Reporduability')
clear all
load('Data/cs10294.mat')
subplot(2,2,4)
plotSinglePixelPeaks(cpp.p2,oldCube.A2,cutCube.A2);
title('Shift Right')
clear all
load('Data/cs10296.mat')
subplot(2,2,1)
plotSinglePixelPeaks(cpp.p2,oldCube.A2,cutCube.A2);
title('Shift Left')
clear all

figure

load('Data/cs10290.mat')
subplot(2,2,2)
customOverlay(cpp.p2,oldCube.A2,cutCube.A2);
title('Slow Speed')
clear all

load('Data/cs10292.mat')
subplot(2,2,3)
customOverlay(cpp.p2,oldCube.A2,cutCube.A2);
title('Reporduability')
clear all

load('Data/cs10294.mat')
subplot(2,2,4)
customOverlay(cpp.p2,oldCube.A2,cutCube.A2);
title('Shift Right')
clear all 
load('Data/cs10296.mat')
subplot(2,2,1)
customOverlay(cpp.p2,oldCube.A2,cutCube.A2);
title('Shift Left')
clear all


