function [realSig]=removeCompFreq(q,freqRemove)
        mag=abs(fft(q));
        phase=angle(fft(q));
        for i=1:length(freqRemove)
            mag(freqRemove(i))=0;
        end
        realSig=ifft(mag.*exp(phase*j));
       

end