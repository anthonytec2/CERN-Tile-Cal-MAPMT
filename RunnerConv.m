clear all
system('root ''readerTest.cxx 10240'' ');
[A, trigger]=importfile('cs10238.txt');
save('cs10238.mat');
clear all
[A, trigger]=importfile('cs10238.txt');
save('cs10239.mat');
clear all

[A, trigger]=importfile('cs10238.txt');
save('cs10240.mat');
clear all

[A, trigger]=importfile('cs10238.txt');
save('cs10241.mat');
clear all

[A, trigger]=importfile('cs10237.txt');
save('cs10237.mat');
clear all

[A, trigger]=importfile('cs10258.txt');
save('cs10258.mat');
clear all

[A, trigger]=importfile('cs10259.txt');
save('cs10259.mat');
clear all

[A, trigger]=importfile('Data/cs10260.txt');
[aDenoise]=pedestalSub(A);
[aChop,cutCube]=chopper(aDenoise,15000,20000,20, [],0);
save('cs10260.mat');
clear all

[A, trigger]=importfile('Data/cs10261.txt');
[aDenoise]=pedestalSub(A);
[aChop,cutCube]=chopper(aDenoise,15000,20000,20, [],0);
save('cs10261.mat');
clear all

[A, trigger]=importfile('Data/cs10262.txt');
[aDenoise]=pedestalSub(A);
[aChop,cutCube]=chopper(aDenoise,15000,20000,20, [],0);
save('cs10262.mat');
clear all

[A, trigger]=importfile('Data/cs10263.txt');
[aDenoise]=pedestalSub(A);
[aChop,cutCube]=chopper(aDenoise,15000,20000,20, [],0);
save('cs10263.mat');
clear all

[A, trigger]=importfile('Data/cs10264.txt');
[aDenoise]=pedestalSub(A);
[aChop,cutCube]=chopper(aDenoise,15000,20000,20, [],0);
save('cs10264.mat');
clear all

[A, trigger]=importfile('Data/cs10265.txt');
[aDenoise]=pedestalSub(A);
[aChop,cutCube]=chopper(aDenoise,15000,20000,20, [],0);
save('cs10265.mat');
clear all
