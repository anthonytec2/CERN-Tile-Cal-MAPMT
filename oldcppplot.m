function [cppLin]=oldCPPplot(cpp,filename)
%Plots CPP(X,Y,Pk#) into cppLin(CHannel Num,Pk#)
%Imports mapping from test file and then
%performs linear conversion from each channel 
mapping=importfileMapping([filename '.txt']);
cppLin=zeros(length(squeeze(cpp(1,1,:))),48);
for i=1:8
    for j=1:8
        if(mapping(i,j)==0)
            
        else
           cppLin(:,mapping(i,j))=squeeze(cpp(i,j,:));
        end
    end
    
end
    
  imagesc(cppLin);
 xlabel('ADC Channel Number');
 ylabel('Peak Number');
 title('Active Pixels during Single Anode PMT Peaks');
 colorbar

 set(gca,'fontsize',24);
end

