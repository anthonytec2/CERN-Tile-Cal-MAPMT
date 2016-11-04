function bestReconstruction(cpp, oldData, data)
[row col]=find(max(max(cpp(:,:,1)))==cpp(:,:,1));
sumA=squeeze(data(row,col,:));

for z=2:length(cpp(1,1,:))
[row col]=find(max(max(cpp(:,:,z)))==cpp(:,:,z));
sumA=sumA+squeeze(data(row,col,:));
end
subplot(1,2,1)
plot(sumA);
xlabel('Triggers');
ylabel('ADC Counts');
title('NEW PMT Data Reconstructed Best Values');
subplot(1,2,2);
plot(oldData);
xlabel('Triggers');
ylabel('ADC Counts');
title('OLD PMT Data');
end

