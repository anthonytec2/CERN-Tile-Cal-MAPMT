function [arNew]=integralDistro(cutCube)
for i=1:length(struct2cell(cutCube))
    subplot(round(length(struct2cell(cutCube))/2),round(length(struct2cell(cutCube))/2),i);
    eval(['data=cutCube.A' int2str(i) ';'])
    inte=sum(data,3);
    inte=inte./(max(max(inte)));
    imagesc(inte);
    xlabel('X Coordinate');
    ylabel('Y Coordinate');
    eval(['title(''Integral Distribution Tile:' int2str(i) ' '');']);
    colorbar
    set(gca,'fontsize',14);
    thresh=.2;
    lowBound=.01;
    if (i==1)
        [row, col]=find((inte<thresh));
        [rowA colB]=find(inte>lowBound);
        row=intersect(row,rowA,'rows');
        col=intersect(colB,col,'rows');
        arNew=[row,col];
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

