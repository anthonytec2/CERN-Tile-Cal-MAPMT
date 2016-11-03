function plotActive(cpp,data,pkNum)
close all
plotss=length(find(cpp(pkNum,:)>0));
loc=find(cpp(pkNum,:)>0);
figure
for i=1:plotss
    subplot(round(plotss/2)+2,round(plotss/2),i);
    plot(data(loc(i),:));
    eval(['title(''Channel' int2str(loc(i)) ''');']);
end
    subplot(round(plotss/2)+2,round(plotss/2),i+1);

    imagesc(cpp);
    title('Mapping of Pixels to Peaks');
    subplot(round(plotss/2)+2,round(plotss/2),i+2);
    plot(data(8,:));
    title('OLD PMT');

end

