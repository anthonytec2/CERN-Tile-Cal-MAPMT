function[ alpha, fitF] =optFit(data, oldData)
MaxIter=100000;
alpha=ones(1,64);
lb = ones(1,64)*-10;
ub = ones(1,64)*10;
%options = optimset('PlotFcns',@optimplotfval);
%[alpha,fval,exitflag,output] = fminsearch(@(alpha)calcError(alpha, oldData,data),alpha)
   opt=saoptimset('simulannealbnd');
   opt.Display='diagnose';
   opt.InitialTemperature=[100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100];
   opt.MaxIter=MaxIter;
   opt.ReannealInterval=3;
[alpha,fval,exitFlag,output] = simulannealbnd(@(alpha)calcError(alpha, oldData,data),alpha,lb,ub,opt);
%options = optimoptions('particleswarm');

%[alpha,fval,exitflag,output] = particleswarm(@(alpha)calcError(alpha, oldData,data),64,lb,ub); 
[sumA]=hypo(alpha, data);
fitF=sumA;
figure
%subplot(1,2,1)
%plot(1:100)
%xlabel('Iterations')
%ylabel('Error')
%title('Cost Function');
%subplot(1,2,1);
plot(sumA);
xlabel('Triggers')
ylabel('ADC Counts')
title('Cost Function');
hold all
plot(oldData);
plot(sumA-oldData);
legend('Hypothesis','Single Anode PMT', 'Error');

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