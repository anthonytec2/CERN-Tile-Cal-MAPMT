fiberNums={'22', '03', '04', '05', '21','22','24','33','41','42'}
%Script to get rid of i,j,k valyes that may be loaded in previously saved
%MAT Files, this can screw with loop iteration
%Therefore I loop over all fiber numbs and remove i,j,k and save the file
for w=1:length(fiberNums)

clearvars -except w
fiberNums={'22', '03', '04', '05', '21','22','24','33','41','42'}
fiberNum=fiberNums{w};
load(['Data/fiber' fiberNum '_large_fokon_0.0gap.txt.mat']);
clear i,j,k;
save(['Data/fiber' fiberNum '_large_fokon_0.0gap.txt.mat']);
clearvars -except w
%%%%
fiberNums={'22', '03', '04', '05', '21','22','24','33','41','42'}
fiberNum=fiberNums{w};
load(['Data/fiber' fiberNum '_15mm_diag.txt.mat']);
clear i,j,k;
save(['Data/fiber' fiberNum '_15mm_diag.txt.mat']);
clearvars -except w
%%%%
fiberNums={'22', '03', '04', '05', '21','22','24','33','41','42'}
fiberNum=fiberNums{w};
load(['Data/fiber' fiberNum '_large_fokon_0.5gap.txt.mat']);
clear i,j,k;
save(['Data/fiber' fiberNum '_large_fokon_0.5gap.txt.mat']);
clearvars -except w
%%%%
fiberNums={'22', '03', '04', '05', '21','22','24','33','41','42'}
fiberNum=fiberNums{w};
load(['Data/fiber' fiberNum '_15.5mm_diag.txt.mat']);
clear i,j,k;
save(['Data/fiber' fiberNum '_15.5mm_diag.txt.mat']);
clearvars -except w
%%%%
fiberNums={'22', '03', '04', '05', '21','22','24','33','41','42'}
fiberNum=fiberNums{w};
load(['Data/fiber' fiberNum '_large_fokon_1.0gap.txt.mat']);
clear i,j,k;
save(['Data/fiber' fiberNum '_large_fokon_1.0gap.txt.mat']);
clearvars -except w
%%%%
fiberNums={'22', '03', '04', '05', '21','22','24','33','41','42'}
fiberNum=fiberNums{w};
load(['Data/fiber' fiberNum '_16mm_diag.txt.mat']);
clear i,j,k;
save(['Data/fiber' fiberNum '_16mm_diag.txt.mat']);
clearvars -except w
%%%%
fiberNums={'22', '03', '04', '05', '21','22','24','33','41','42'}
fiberNum=fiberNums{w};
load(['Data/fiber' fiberNum '_16.5mm_diag.txt.mat']);
clear i,j,k;
save(['Data/fiber' fiberNum '_16.5mm_diag.txt.mat']);
clearvars -except w
%%%%
fiberNums={'22', '03', '04', '05', '21','22','24','33','41','42'}
fiberNum=fiberNums{w};
load(['Data/fiber' fiberNum '_large_fokon_1.5gap.txt.mat']);
clear i,j,k;
save(['Data/fiber' fiberNum '_large_fokon_1.5gap.txt.mat']);
clearvars -except w
%%%%
fiberNums={'22', '03', '04', '05', '21','22','24','33','41','42'}
fiberNum=fiberNums{w};
load(['Data/fiber' fiberNum '_large_fokon_2.0gap.txt.mat']);
clear i,j,k;
save(['Data/fiber' fiberNum '_large_fokon_2.0gap.txt.mat']);
clearvars -except w
%%%%
fiberNums={'22', '03', '04', '05', '21','22','24','33','41','42'}
fiberNum=fiberNums{w};
load(['Data/fiber' fiberNum '_17mm_diag.txt.mat']);
clear i,j,k;
save(['Data/fiber' fiberNum '_17mm_diag.txt.mat']);
clearvars -except w
end