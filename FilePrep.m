function plotActive(cpp,data,pkNum)
plotss=length(find(cpp(num,:)>0));
loc=find(cpp(num,:)>0);

for i=1:plotss
    subplot(round(plotss/2),round(plotss/2),plotss);
    plot(data(loc(plotss),:));
    eval(['title(''Channel' int2str(loc(plotss)) ''');']);
end

end

