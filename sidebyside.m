load('Data/cs10240.mat')
subplot(1,2,1)
customOverlay(cpp.p2,oldCube.A2,cutCube.A2);
title('Air Gap')
clear all

load('Data/cs10264.mat')
subplot(1,2,2)
customOverlay(cpp.p2,oldCube.A2,cutCube.A2);
title('Fiber Light Guide')
clear all 

load('Data/cs10240.mat')
subplot(1,2,1)
oldcppplot(cpp.p2,'mapping')
title('Air Gap')
clear all

load('Data/cs10264.mat')
%subplot(1,2,2)
oldcppplot(cpp.p2,'mapping')
title('Fiber Light Guide')
clear all 
