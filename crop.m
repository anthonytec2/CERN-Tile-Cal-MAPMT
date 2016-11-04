function[aCrop,cropOld]= crop(A,EO,old)
aCrop=[];
if(EO==1)
   [loc pk]=findpeaks(old,'MinPeakHeight',700,'MinPeakDistance',60);
    aCrop=A(:,:,(pk(1)-700):(pk(end)+400));
    cropOld=old((pk(1)-700):(pk(end)+400));
else
   aCrop=A(:,:,2000:7000);
   cropOld=old(2000:7000);
end


end