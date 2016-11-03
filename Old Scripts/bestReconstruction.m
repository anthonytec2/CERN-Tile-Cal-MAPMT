function bestReconstruction(cpp, data)
close all;
sumA=zeros(1,length(data(1,:)));
for i=1:length(cpp(:,1))
   loc=find(max(cpp(i,:))==cpp(i,:));
   
   sumA=sumA+data(loc,:); 
end

figure;
subplot(1,2,1)
plot(sumA);
xlabel('Triggers');
ylabel('ADC Counts');
title('New PMT Data 1 Region');
subplot(1,2,2)
plot(data(8,:));
xlabel('Triggers');
ylabel('ADC Counts');
title('Old PMT Data 1 Region');


end