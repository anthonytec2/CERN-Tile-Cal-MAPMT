

for i=1:8
    for j=1:8
        if(max(squeeze(cutCube.A2(i,j,:)))>0)
        dataFilt(i,j,:)=real(squeeze(removeCompFreq(squeeze(cutCube.A2(i,j,:)),[126,157])));
        else
        dataFilt(i,j,:)=zeros(1,length(oldCube.A2)); 
        end
    end
    
end