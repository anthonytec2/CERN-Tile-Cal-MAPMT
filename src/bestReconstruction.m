function bestReconstruction(cpp, oldData, data)
%CPP is an array of dimension(X,Y,Pixel Num) holding crop region constant
%oldData is data of the single anode pmt corresponding to crop region
%data is a 3d array (X,Y,Trigger Num) of a single crop region
%Tries to perform addition of the best channels of the NEW PMT to acquire
%old PMT signal

ampThresh=30;%Threshold of the lostest max amplitude to add
ratioThresh=.15;%Ratio in CPP which should be accepted above
[row col]=find(cpp(:,:,1)>ratioThresh);%Finds the pixels grater than above amp
sumA=squeeze(data(col(1),row(1),:));%Adds initial to use for base
if(length(row)>1)%Checks to see if there is one than one above thresh
    for i=1:length(row)%Goes through all that are in find array
        if(max(squeeze(data(col(i),row(i),:)))>ampThresh)%Checks if this signal is above amp thresh
            sumA=sumA+squeeze(data(col(i),row(i),:));%add this signal to sum
        end
    end
end
%PERFORMS THE SAME FUNCTION AS ABOVE LOOP just for peaks 2-N
for z=2:length(cpp(1,1,:))
[row col]=find(cpp(:,:,z)>ratioThresh);
    for i=1:length(row)
        if(max(squeeze(data(col(i),row(i),:)))>ampThresh)
        sumA=sumA+squeeze(data(col(i),row(i),:));
        end
    end
end
%plots old PMT versus sum
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

