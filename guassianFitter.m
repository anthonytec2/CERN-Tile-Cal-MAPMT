function [f] = guassianFitter(pixelActive, oldData, type)
if(nargin==2)
   type=1; 
end
f=[];
if type==0

    
    [loc pks]=findpeaks(oldData,'MinPeakHeight',400,'MinPeakDistance',8);% find all the peaks in the data
    %[locD pksD]=findpeaks(pixelActive,'MinPeakHeight',mean(pixelActive),'MinPeakDistance',8);% find all the peaks in the data
    dPks=diff(pixelActive);
    [locD pksD]=findpeaks(dPks,'MinPeakHeight',mean(abs(dPks))+10,'MinPeakDistance',8);
    
    for i=1:length(pks)
    for j=1:length(pksD)
   if(pks(i)-6<pksD(j)&&pksD(j)<pks(i)+6)
       trig=((pksD(j)-5):(pksD(j)+5))';
       f=fit(trig,pixelActive(pksD(j)-5:pksD(j)+5),'gauss2');
    disp('Ready');
   end
    end
end    
%     mL=mean(diff(pks))/18.2;
   % trigger=((1:length(oldData))*mL)';
    
else
    
    
%Attenuation Length 
%Sigma 
%2,4 pixel

trigger=(1:length(oldData))';
f=fit(trigger,pixelActive,'gauss2');
plot(f,trigger,pixelActive);
pause(1)
end

end

