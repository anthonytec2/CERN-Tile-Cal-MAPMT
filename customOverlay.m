function customOverlay(cpp, oldData, data)
%Custom Overlay creates a plot showing OLD PMT and Max Amplitude pixels
%CPP is an array of channels per peak (X,Y,Peak Num) with values being
%max(newPMTPixel)/max(oldPMTPixel)
%oldData is data of the single anode pmt corresponding to crop region
%data is a 3d array (X,Y,Trigger Num) of a single crop region

labels={'Single Anode PMT'};%Creates labels array for legened
    plot(oldData,'LineWidth',2);
    [loc pks]=findpeaks(oldData,'MinPeakHeight',400,'MinPeakDistance',8);% find all the peaks in the data
    hold all;%Overlay all the plots found
    for i=1:length(cpp(1,1,:))
        [row col]=find(max(max(cpp(:,:,i)))==cpp(:,:,i),1,'first');%Find the max pixel
        z=plot(squeeze(data(col,row,:)),'LineWidth',2);%plot max pixel         labels=[labels ['New PMT Pixel: ' int2str(row) ',' int2str(col) ]];%add pixel to max array
        text(pks(i)-4,max(loc)+150,[int2str(row) ',' int2str(col) ],'FontSize',16,'color',z.Color);%Creates labels for max pixel on plot
        q=annotation('line',[.7 .7],[.5 .7],'color',z.Color);
        q.LineStyle='--';
        hold all
    end
    
   
legend(labels);%draws legend with labels
%Plot formatting
title('Single Anode PMT and Maximum Ampiltude Pixels of MAPMT');
xlabel('Triggers');
ylabel('ADC Counts');
set(gca,'fontsize',14);
end


