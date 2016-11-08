function  maxRecon( cpp, oldData, data )
%Max Recon, Reconstruts New PMT Sum only on max amplitudes
%CPP is an array of channels per peak (X,Y,Peak Num) with values being
%max(newPMTPixel)/max(oldPMTPixel)
%oldData is data of the single anode pmt corresponding to crop region
%data is a 3d array (X,Y,Trigger Num) of a single crop region
%plots old PMT
    plot(oldData,'LineWidth',2);
    hold all;
    sumA=zeros(1,length(oldData));
    for i=1:length(cpp(1,1,:))
        %Searches for first max amplitude PMT pixel for peak
        [row col]=find(max(max(cpp(:,:,i)))==cpp(:,:,i),1,'first');
        sumA=sumA+squeeze(data(col,row,:));%adds this to sum
        hold all
    end
    
   plot(sumA,'LineWidth',2);%plots sum
   %Plot formatting
title('Single Anode PMT vs. MAPMT Sum Maximum Ampiltude Pixels');
xlabel('Triggers');
ylabel('ADC Counts');
legend('Single Anode PMT','MAPMT Sum');
set(gca,'fontsize',14);


end

