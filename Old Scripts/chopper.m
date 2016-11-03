function [aChoped,cutCube]=chopper(A,start,endC,thresh,preloadcut,flag)
close all
aChop(:,:)=A(:,start:endC);
medVal=median(aChop(8,:));

loc=find(aChop(8,:)>(medVal+thresh));
aChoped(:,:)=aChop(:,loc(1):loc(end));

dx=diff(aChoped(8,:));
figure;
plot(dx);
if flag==1
bounds=preloadcut;
cuts=length(bounds)/2;
else
cuts=input('Chop Nums');
bounds=[];
for i=1:cuts
    minBound=input('Min Bound');
    maxBound=input('Max Bound');
    bounds=[bounds minBound maxBound];
end
clear i;

end

for i=1:2:2*cuts    
 cutMat(:,:)=aChoped(:,bounds(i):bounds(i+1));
 eval(['cutCube.A' num2str(round(i/2)) '=cutMat']);
 if cuts<3
     subplot(1,2,round(i/2));
     eval(['plot(cutCube.A' int2str(round(i/2)) '(8,:))'])
     eval(['title(''chop ' int2str(round(i/2)) ' '',''fontsize'',18);' ]);
     
 else
    if(mod(cuts,2)==0)
        subplot(cuts/2,cuts/2,round(i/2));
    else
        subplot(round(cuts/2),cuts/2,round(i/2));
         
    end
    eval(['plot(cutCube.A' int2str(round(i/2)) '(8,:))'])
    eval(['loc=findpeaks(cutCube.A' int2str(round(i/2)) '(8,:),''MinPeakHeight'',median(cutMat(8,:)))'])
    eval(['findpeaks(cutCube.A' int2str(round(i/2)) '(8,:),''MinPeakHeight'',median(cutMat(8,:)))'])
    eval(['title(''chop ' int2str(round(i/2)) ' '',''fontsize'',18 );' ]);
    
    eval(['text((length(cutCube.A' int2str(round(i/2)) '(8,:))/2)-40,100,[''Peak Nums:'' int2str(length(loc))],''fontsize'',16)']);
    
end


 clear cutMat;
end


end