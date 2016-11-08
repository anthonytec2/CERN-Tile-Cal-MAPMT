function bestReconstruction(cpp, oldData, data)
ampThresh=30;
ratioThresh=.15;
[row col]=find(cpp(:,:,1)>ratioThresh);
sumA=squeeze(data(col(1),row(1),:));
if(length(row)>1)
    for i=1:length(row)
        if(max(squeeze(data(col(i),row(i),:)))>ampThresh)
            sumA=sumA+squeeze(data(col(i),row(i),:));
        end
    end
end
for z=2:length(cpp(1,1,:))
[row col]=find(cpp(:,:,z)>ratioThresh);
    for i=1:length(row)
        if(max(squeeze(data(col(i),row(i),:)))>ampThresh)
        sumA=sumA+squeeze(data(col(i),row(i),:));
        end
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

