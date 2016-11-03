function plotCuts(cutCube)
cuts=length(struct2cell(cutCube));
for i=1:2:2*cuts
    if(mod(cuts,2)==0)
        subplot(cuts/2,cuts/2,round(i/2));
    else
        subplot(round(cuts/2),cuts/2,round(i/2));
         
    end
    eval(['plot(cutCube.A' int2str(round(i/2)) '(8,:))'])
    eval(['loc=findpeaks(cutCube.A' int2str(round(i/2)) '(8,:),''MinPeakHeight'',median(cutCube.A' int2str(round(i/2)) '(8,:)))'])
    eval(['findpeaks(cutCube.A' int2str(round(i/2)) '(8,:),''MinPeakHeight'',median(cutCube.A' int2str(round(i/2)) '(8,:)))'])
    eval(['title(''chop ' int2str(round(i/2)) ' '',''fontsize'',18 );' ]);
    
    eval(['text((length(cutCube.A' int2str(round(i/2)) '(8,:))/2)-40,100,[''Peak Nums:'' int2str(length(loc))],''fontsize'',16)']);

end

end