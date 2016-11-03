function displayAllPlot(data)
for i=1:48
subplot(7,7,i);
plot(data(i,:));
title([int2str(i) 'ith Plot']);
end
end

