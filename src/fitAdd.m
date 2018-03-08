function [ dataGuass,sumA] = fitAdd( data,oldData,ampThresh)
if(nargin==2)
    ampThresh=100;
end

dataGuass=zeros(8,8,length(oldData));
for i=1:8
    for j=1:8
       holder=squeeze(data(i,j,:));
        if(max(squeeze(data(i,j,:)))>ampThresh) %&&mean(squeeze(data(i,j,:)))>12
            plot(holder);
            while(max(holder)>ampThresh)%&&mean(holder)>4
             
            temp=guassianFitter(holder,oldData);
            dataGuass(i,j,:)=squeeze(dataGuass(i,j,:))+temp(1:length(oldData));
            holder=holder-squeeze(dataGuass(i,j,:));
            end
            
        else
            dataGuass(i,j,:)=zeros(1,length(data(i,j,:)));
        end
        
    end
end

sumA=squeeze(sum(sum(dataGuass(:,:,:),1),2));
end

