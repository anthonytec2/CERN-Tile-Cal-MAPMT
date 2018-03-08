function customOverlay(cpp, oldData, data)
%Custom Overlay creates a plot showing OLD PMT and Max Amplitude pixels
%CPP is an array of channels per peak (X,Y,Peak Num) with values being
%max(newPMTPixel)/max(oldPMTPixel)
%oldData is data of the single anode pmt corresponding to crop region
%data is a 3d array (X,Y,Trigger Num) of a single crop region

cla reset
holdData=[];
labels={'Single Anode PMT'};%Creates labels array for legened
    plot(oldData,'Color',[0,0,0],'LineWidth',5);
    [loc pks]=findpeaks(oldData,'MinPeakHeight',600,'MinPeakDistance',6);% find all the peaks in the data
    hold all;%Overlay all the plots found
    writeText=[];
    colorHolder=[];
    for i=1:length(cpp(1,1,:))
        [row col]=find(max(max(cpp(:,:,i)))==cpp(:,:,i),1,'first');%Find the max pixel
        z=plot(squeeze(data(col,row,:)),'LineWidth',5);%plot max pixel         
        holdData(i)=max(z.YData(pks(i)-2:pks(i)+2))+15;
        colorHolder=[colorHolder, z.Color];
        labels=[labels ['MA-PMT Pixel: ' int2str(row) ',' int2str(col) ]];%add pixel to max array
        writeText=[writeText row , col ];
        %text(pks(i),max(loc),[int2str(row) ',' int2str(col) ],'FontSize',16,'color',z.Color);%Creates labels for max pixel on plot
        %line([pks(i) pks(i)],[max(z.YData) (3000)],'color',z.Color,'LineStyle','--','LineWidth',2);
        hold all
    end
    maxVal=max(holdData);
    for i=1:length(cpp(1,1,:))
        text(pks(i)-3,maxVal+10,[int2str(writeText(2*i-1)) ',' int2str(writeText(2*i))],'FontSize',27,'color',colorHolder((3*i-2):(3*i)));
        line([pks(i) pks(i)],[holdData(i)-15 maxVal],'color',colorHolder((3*i-2):(3*i)),'LineStyle','--','LineWidth',5);
    end
   q=gca;
   limY=q.YLim;
   limY(2)=limY(2)+40;
   set(q,'YLim',limY);
legend(labels);%draws legend with labels
%Plot formatting
title('Single Anode PMT and Maximum Ampiltude Pixels of MAPMT');
xlabel('Triggers');
ylabel('ADC Counts');
set(gca,'fontsize',22);
ylim=get(gca,'YLim');
ylim(1)=0;
set(gca,'YLim',ylim);
Xlim=get(gca,'XLim');
Xlim(2)=length(oldData);
set(gca,'XLim',Xlim);
set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.

end


