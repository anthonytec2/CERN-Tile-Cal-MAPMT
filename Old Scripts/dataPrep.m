function dataPrep( name )
[A, trigger]=importfile(['cs' int2str(name) '.txt']);
[aDenoise]=pedestalSub(A);
plot(A(8,:));
bO=input('cutone');
bT=input('cuttwo');
[aChop,cutCube]=chopper(aDenoise,bO,bT,20, [],0);
save(['cs' int2str(name) '.mat']);
close all
end

