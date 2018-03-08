%IMPORT SCRIPT FOR DATA
%IMPORT ALL DATA FROM GIVEN DATE DIRECTORY
if(exist('APedestal')==0)
%GETS PEDESTAL FILE FOR BACKGROUN SUBTRACTION
    [TriggerPed,TimePed,APedestal] = importTBdata('Data/9_December/fiber42_pedestal_new_voltage.txt');
end
%name={'fiber22_16mm_5Dec',	'pixel13-02-12','backgroundon-1202',	'fiber22_17.5mm_5Dec',	'pixel24-02-12','fiber03_15.5mm_5Dec',	'fiber22_17mm_5Dec',	'pixel29-02-12','fiber03_15mm_5Dec',	'fiber22_18mm_5Dec',	'pixel29run','fiber03_16.5mm_5Dec',	'fiber33_15.5mm_5Dec',	'pixel34-02-12','fiber03_16mm_5Dec',	'fiber33_15mm_5Dec',	'pixel38-02-12','fiber03_17.5mm_5Dec',	'fiber33_16.5mm_5Dec',	'pixel43-02-12','fiber03_17mm_5Dec',	'fiber33_16mm_5Dec',	'pixel59-02-12','fiber03_18mm_5Dec',	'fiber33_17.5mm_5Dec',	'pixel59-12-03','fiber22_15.5mm_5Dec',	'fiber33_17mm_5Dec',	'pixel64-02-12','fiber22_15mm_5Dec',	'fiber33_18mm_5Dec',	'pixel68-02-12','fiber22_16.5mm_5Dec',	'pixel01-02-12'};
q=dir('Data/9_December/*.txt');
name=[];
p=1;
for z=1:length(q)%
%if(strfind(q(z).name,'2.5')>0)
name{p}={q(z).name};%Adds all the names to the name vector to be saved
p=p+1;
%else
%end
end
%clear ADataDenoise,AData
for k=1:length(name)
k
%Imports all the data in the name variables file name
[Trigger,Time,AData] = importTBdata(['Data/9_December/' cell2mat(name{k})]);
for i=1:8
    for j=1:8
        AData(i,j,find(AData(i,j,:)<0))=4586;%Get rid of any satruated values which will show up as negatives
        ADataDenoise(i,j,:)=squeeze(AData(i,j,:)-mean(APedestal(i,j,:)));%Perform backgroun subtraction
        ADataDenoise(i,j,find(ADataDenoise(i,j,:)<0))=0;%Get Rid of any negative couns from pedestal subtraction
    end
end

%imagesc(mean(ADataDenoise,3));
%colorbar
%xlabel('X Position');
%ylabel('Y Position');
%title(cell2mat(name{k}));
%saveas(gcf,['Plots/' cell2mat(name{k}) '.png']);
%makeMovie(ADataDenoise, cell2mat(name{k}),100,1,1);

save(['Data/' cell2mat(name{k}) '.mat'], '-regexp', '^(?!(i|j|k|z)$).');%Save data file to a mat file
clear ADataDenoise,Trigger, Time, AData;
end