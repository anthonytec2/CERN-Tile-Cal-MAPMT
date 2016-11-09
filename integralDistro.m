function integralDistro(data)
inte=sum(data,3);
inte=inte./(max(max(inte)));
imagesc(inte);
xlabel('X Coordinate');
ylabel('Y Coordinate');
title('Integral Distribution');
colorbar
set(gca,'fontsize',14);


end

