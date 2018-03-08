clear all
load('Data/cs10264.mat')
q=squeeze(cutCube.A2(2,5,:));
mag=abs(fft(q));
phase=angle(fft(q));
plot(mag)
%n=2;
%mag(2:(2+n))=0;
%mag((281-n):281)=0;
mag(126)=0;
mag(157)=0;
realSig=ifft(mag.*exp(phase*j));

plot(realSig,'linewidth',6)
hold all
plot(q)


%{
z=1;
    for i=1:8
        for j=1:8
        subplot(8,8,z);
        q=squeeze(cutCube.A2(i,j,:));
        mag=abs(fft(q));
        %if(any(squeeze(data(i,j,:))>25))
           %plot(squeeze(data(i,j,:)));
        plot(mag)
        %else
         %   plot(squeeze(data(1,2,:)));
        %end
        title([int2str(z) 'ith Plot']);
        z=z+1;
        end
    end
%}
%FFT Freq
Fs=140;
T=1/Fs;
L=length(q);
t=(0:L-1)*T;
f=Fs*(0:(L/2))/L;
P2=abs(fft(q)/L);
P1=P2(1:L/2+1);
P1(2:end-1)=2*P1(2:end-1);
plot(f,P1);


