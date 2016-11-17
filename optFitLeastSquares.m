%THIS ALGORITHM SHOULD BE USED
function optFitLeastSquares(data, oldData)
%A=reshape(data, [64, length(squeeze(data(1,1,:)))])';%A
%Y=oldData;
XO=ones(1,64)';
X = lsqnonlin(@(XO)calcError(XO, oldData,data),XO)
%x = lsqcurvefit(@(XO)calcError(XO, oldData,data),XO,A,Y)
%X = mldivide(A,Y);
disp('here we go');
sumA=hypo(X, data);

figure

plot(sumA,'linewidth',1.5);
xlabel('Triggers')
ylabel('ADC Counts')
title('320: Digital Sum with Weights MA-PMT to Single Anode PMT');
hold all
plot(oldData,'linewidth',1.5);
plot(sumA-oldData,'linewidth',1.5);
legend('Hypothesis','Single Anode PMT', 'Error');
[loc pks]=findpeaks(oldData,'MinPeakHeight',800,'MinPeakDistance',6);
[locB pksB]=findpeaks(sumA,'MinPeakHeight',800,'MinPeakDistance',6);
rmsAr=sqrt((loc-locB).^2);
text(20,500,'Mean of Differenece=>','fontsize',13)
text(125,500,num2str(mean(rmsAr)),'fontsize',13)
text(20,200,'RMS of Differenece=>','fontsize',13)
text(125,200,num2str(sqrt(sum((rmsAr).^2))),'fontsize',13);
text(250,500,['Mean Error:' num2str(mean(sumA-oldData))],'fontsize',13);
chiS=chiSquare(sumA,oldData);
text(225,800,['Chi^2 Error:' num2str(chiS)],'fontsize',13);

set(gca,'fontsize',15);
end

function [sumA]=hypo(alpha, data)
sumA=(zeros(1,length(data(1,1,:))))';

for i=1:8
    for j=1:8
        sumA=sumA+alpha((i-1)*8+j).*squeeze(data(i,j,:));
    end
end

end

function [error]=calcError(alpha, oldData,data)

sumA=(zeros(1,length(data(1,1,:))))';
alphaA=reshape(alpha,[8,8])';
sumA=squeeze(sum(sum(alphaA.*data,1),2));

error=sum(((oldData-sumA).^2));

end