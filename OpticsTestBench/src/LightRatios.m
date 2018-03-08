[sumVecAir] =compareScript(1);% Gets the data from the integrals at each dist for Air Gap
[sumVecTaper] =compareScript(0);% Gets the data from the integrals at each dist for Taper
RatiosLight=sumVecTaper./sumVecAir;%Performs the abosolute ratio of these two elements
fiberNums={'22', '03', '04', '05', '21','22','24','33','41','42'}
    dist=[0 0.5 1 1.5 2];

for i=1:10
    
plot(dist,RatiosLight(i,:),'*','MarkerSize',20); %Plots the light ratio
hold all
end
xlabel('Distance(mm)');%labels plot
ylabel('Light Integral Ratio');
title('Large Taper Light Integral Ratios');
set(gca,'fontsize',20)

legend(fiberNums);%Puts this in a legend