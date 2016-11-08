function customOverlay(cpp, oldData, data)
labels={'Single Anode PMT'};
    plot(oldData,'LineWidth',2);
    [loc pks]=findpeaks(oldData,'MinPeakHeight',400,'MinPeakDistance',8);
    hold all;
    for i=1:length(cpp(1,1,:))
        [row col]=find(max(max(cpp(:,:,i)))==cpp(:,:,i),1,'first');
        plot(squeeze(data(col,row,:)),'LineWidth',2);
        labels=[labels ['New PMT Pixel: ' int2str(row) ',' int2str(col) ]];
        text(pks(i)-4,loc(i)+60,[int2str(row) ',' int2str(col) ],'FontSize',14);
        hold all
    end
    
   
legend(labels);
title('Single Anode PMT and Maximum Ampiltude Pixels of MAPMT');
xlabel('Triggers');
ylabel('ADC Counts');
set(gca,'fontsize',14);
end


