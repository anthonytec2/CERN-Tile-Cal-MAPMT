function [arNew]=integralDistro(cutCube)
%Function to find dead pixels
%Functions averages all of the data from the trigger dimension
%after this data is plotted for each cut of cutCube
%Input is the whole cutCube which will later plot all of its contents
for i=1:length(struct2cell(cutCube))
    subplot(round(length(struct2cell(cutCube))/2),round(length(struct2cell(cutCube))/2),i);
    eval(['data=cutCube.A' int2str(i) ';'])
    %Get specific cutcube data and sums along the trigger dimension
    inte=sum(data,3);
    inte=inte./(max(max(inte)));%normalizes to the maximal value
    imagesc(inte);%image the plot
    xlabel('X Coordinate');%label the plot
    ylabel('Y Coordinate');
    eval(['title(''Integral Distribution Tile:' int2str(i) ' '');']);
    colorbar
    set(gca,'fontsize',14);
    thresh=.2;
    lowBound=.01;%Finder of dead pixels
    if (i==1)
        [row, col]=find((inte<thresh));%Find if pixels are bellow theshold
        [rowA colB]=find(inte>lowBound);%Find if pixels are above lowBound
        row=intersect(row,rowA,'rows');%Find the interesection of these set
        col=intersect(colB,col,'rows');
        arNew=[row,col];%Set equal in the dead pixels array, dead pixels found
    else
        [row, col]=find((inte<thresh));
        [rowA colB]=find(inte>lowBound);
        row=intersect(row,rowA,'rows');
        col=intersect(colB,col,'rows');
        arNew=intersect(arNew,[row, col],'rows');
    end
    arOld=arNew;
end

end

