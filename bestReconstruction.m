function bestReconstruction(cpp, oldData, data)
[row col]=find(cpp(:,:,1)>0.1);
sumA=squeeze(data(row(1),col(1),:));
if(length(row)>1)
    for i=1:length(row)
        sumA=sumA+squeeze(data(row(i),col(i),:));
    end
end
for z=2:length(cpp(1,1,:))
[row col]=find(cpp(:,:,1)>0.1);
    for i=1:length(row)
        sumA=sumA+squeeze(data(row(i),col(i),:));
    end
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

