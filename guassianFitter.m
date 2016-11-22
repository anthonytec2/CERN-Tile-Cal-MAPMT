function [f] = guassianFitter(pixelActive, oldData)

%Attenuation Length 
%Sigma 
%2,4 pixel
%[loc pks]=findpeaks(oldData,'MinPeakHeight',400,'MinPeakDistance',8);% find all the peaks in the data
%mL=mean(diff(pks))/18.2;
%trigger=((1:length(oldData))*mL)';
trigger=(1:length(oldData))';
f=fit(trigger,pixelActive,'gauss2');
%plot(f,trigger,pixelActive);

%y=A0*(GSh*exp(-0.5*()))
end

