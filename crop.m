function[aCrop,cropOld]= crop(A,EO,old)
%Performs a Crop, only gets data in region of 2 signal peals
%Based on file scan foward or backwards crops differently
%EO helps in this Even nums are foward, odd backwards
aCrop=[];%develop crop array
if(EO==1)
    %if even crops based on max peaks found the last and first peaks
   [loc pk]=findpeaks(old,'MinPeakHeight',600,'MinPeakDistance',60);
    aCrop=A(:,:,(pk(1)-700):(pk(end)+400));
    cropOld=old((pk(1)-700):(pk(end)+400));
else
    %if odd crops based on known hard coded "working ranges"
   aCrop=A(:,:,2000:7000);
   cropOld=old(2000:7000);
end


end