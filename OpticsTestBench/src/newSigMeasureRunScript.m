%fiberNums={'22', '03', '04', '05', '21','22','24','33','41','42'}%Fiber nums tested
fiberNums={'42','41','33'}
airGap=1;%New or Old Air Gap
type='Air_Gap';
sumVec=[];%Vector integrals at each distance
for i=1:length(fiberNums)
    fiberNum=fiberNums{i};%sets to fiberNum active
    
    load(['Data/fiber' fiberNum '_0.0_air_gap_new_voltage.txt.mat']);

    
    A(1,:,:,:)=ADataDenoise;
    
    
    load(['Data/fiber' fiberNum '_0.5_air_gap_new_voltage.txt.mat']);
    
    A(2,:,:,:)=ADataDenoise;
    
    
    load(['Data/fiber' fiberNum '_1.0_air_gap_new_voltage.txt.mat']);
    
    A(3,:,:,:)=ADataDenoise;
    
    load(['Data/fiber' fiberNum '_1.5_air_gap_new_voltage.txt.mat']);
    
    A(4,:,:,:)=ADataDenoise;
    
    load(['Data/fiber' fiberNum '_2.0_air_gap_new_voltage.txt.mat']);
    
    A(5,:,:,:)=ADataDenoise;
    load(['Data/fiber' fiberNum '_2.5_air_gap_new_voltage.txt.mat']);
    A(6,:,:,:)=ADataDenoise;
    
    load(['Data/fiber' fiberNum '_3.0_air_gap_new_voltage.txt.mat']);
    A(7,:,:,:)=ADataDenoise;
    load(['Data/fiber' fiberNum '_3.5_air_gap_new_voltage.txt.mat']);
    A(8,:,:,:)=ADataDenoise;
    load(['Data/fiber' fiberNum '_4.0_air_gap_new_voltage.txt.mat']);
    A(9,:,:,:)=ADataDenoise;
    load(['Data/fiber' fiberNum '_4.5_air_gap_new_voltage.txt.mat']);
    A(10,:,:,:)=ADataDenoise;
    load(['Data/fiber' fiberNum '_5.0_air_gap_new_voltage.txt.mat']);
    A(11,:,:,:)=ADataDenoise;
    load(['Data/fiber' fiberNum '_5.5_air_gap_new_voltage.txt.mat']);
    A(12,:,:,:)=ADataDenoise;
    load(['Data/fiber' fiberNum '_6.0_air_gap_new_voltage.txt.mat']);
    A(12,:,:,:)=ADataDenoise;
    load(['Data/fiber' fiberNum '_6.5_air_gap_new_voltage.txt.mat']);
    A(13,:,:,:)=ADataDenoise;
    load(['Data/fiber' fiberNum '_7.0_air_gap_new_voltage.txt.mat']);
    A(14,:,:,:)=ADataDenoise;
    load(['Data/fiber' fiberNum '_7.5_air_gap_new_voltage.txt.mat']);
    A(15,:,:,:)=ADataDenoise;
    load(['Data/fiber' fiberNum '_8.0_air_gap_new_voltage.txt.mat']);
    A(16,:,:,:)=ADataDenoise;
    load(['Data/fiber' fiberNum '_8.5_air_gap_new_voltage.txt.mat']);
    A(17,:,:,:)=ADataDenoise;
    load(['Data/fiber' fiberNum '_9.0_air_gap_new_voltage.txt.mat']);
    A(18,:,:,:)=ADataDenoise;
    load(['Data/fiber' fiberNum '_9.5_air_gap_new_voltage.txt.mat']);
    A(19,:,:,:)=ADataDenoise;
    load(['Data/fiber' fiberNum '_10.0_air_gap_new_voltage.txt.mat']);
    A(20,:,:,:)=ADataDenoise;
figure
for i=1:20
    subplot(5,4,i);
   imagesc(squeeze(mean(squeeze(A(i,:,:,:)),3)))
   colorbar
   title([num2str((i-1)*0.5) 'mm' type]);
   
end
    set(gca,'fontsize',13)
    set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.

saveas(gcf,['Plots/Comparsion' type 'AirLowVol' fiberNum '.jpg']);
muvec=[];
sigvec=[];
figure
for i=1:10
    [row col]=find(max(max(mean(squeeze(A(i,:,:,:)),3)))==mean(squeeze(A(i,:,:,:)),3),1,'first');
    histogram(squeeze(squeeze(A(i,row,col,:))));
    xlabel('ADC Counts');
    ylabel('Counts');
    [muvec(i),sigvec(i)] = normfit(squeeze(squeeze(A(i,row,col,:))));
    hold all
end
    set(gca,'fontsize',13)
    set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.

    legend('0mm','0.5mm','1.0mm','1.5mm','2.0mm','2.5mm','3.0mm','3.5mm','4.0mm','4.5mm','5.0mm','5.5mm','6.0mm','6.5mm','7.0mm','7.5mm','8.0mm','8.5mm','9.0mm','9.5mm');
saveas(gcf,['Plots/histogram' type 'AirLowVol' fiberNum '.jpg']);
figure
    for i=1:20
    [row col]=find(mean(squeeze(A(i,:,:,:)),3)>10);%plots integral distrbution across each distance
       tempSum=0;
        for j=1:length(row)
          temp=mean(squeeze(A(i,:,:,:)),3);
          tempSum=tempSum+temp(row(j),col(j));
        end
        sumVec=[sumVec tempSum];
    end
    dist=0:.5:9.5;
    plot(dist,sumVec,'*','MarkerSize',20);
    xlabel(['Optical ' type ' Distance']);
    ylabel('Integral Value');
    title('Integral Distance');
    set(gca,'fontsize',20)
        set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.

%    saveas(gcf,['Plots/Comparsion' type 'thre' fiberNum '.png']);
    saveas(gcf,['Plots/Integral' type 'AirLowVol' fiberNum '.jpg']);

    
end

