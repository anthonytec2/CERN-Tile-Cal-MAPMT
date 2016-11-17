function  [sumB]=plotSinglePixelPeaks(cpp, oldData, data,thresh)

[loc pks]=findpeaks(oldData,'MinPeakHeight',400,'MinPeakDistance',6);
trig=1:length(oldData);
%plot(trig,oldData);
%xlabel('Triggers');
%ylabel('ADC Counts');
%title('Pixels for each Peak that are Strong');
%hold all
sumA=zeros(1,length(oldData));
sumB=zeros(1,length(oldData));
for i=1:length(squeeze(cpp(1,1,:)))
    [row, col]=find(cpp(:,:,i)>thresh);
    for j=1:length(col)
       pix= squeeze(data(col(j),row(j),:));
       partial=zeros(1,length(oldData));
       partial(pks(i)-5:pks(i)+5)=pix(pks(i)-5:pks(i)+5);
       %plot(pix);
       sumA=sumA+partial;
       sumB=sumB+pix';
       %plot(sumA);
       %plot(pks(i)-5:pks(i)+5,pix(pks(i)-5:pks(i)+5))
    end
end
%plot(trig,squeeze(sumA./(max(sumA)/max(oldData))),'linewidth',2);
%plot(trig,squeeze(sumB./(max(sumB)/max(oldData))),'linewidth',2);
%legend('Single Anode PMT', 'New PMT Only peak widths', 'New PMT');
%set(gca,'fontsize',14);
end


