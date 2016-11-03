function [cpp]=analysis(peaks, data)
%Channels Per Peak (PK#,#)
PPC=[];
cpp=[];
for i=1:48
        if(i==8)
            
        else 
            [loc pks]=findpeaks(data(i,:),'MinPeakHeight',100,'MinPeakDistance',10);
            %PPC(i,:)=pks;
            for j=1:length(pks)
               for k=1:length(peaks)
                   if(peaks(k)-5<pks(j) && pks(j)<peaks(k)+5)
                       if(isempty(cpp))
                             if(data(i,pks(j))>data(8,peaks(k))-400)
                               cpp(k,i)=[1];
                             elseif(data(i,pks(j))>data(8,peaks(k))-800)
                                   cpp(k,i)=[.6];
                             elseif(data(i,pks(j))>data(8,peaks(k))-1200)
                                   cpp(k,i)=[.4];
                            else 
                                   cpp(k,i)=[.1];
                           
                           end
                           
                       else
                             if(data(i,pks(j))>data(8,peaks(k))-400)
                               cpp(k,i)=[1];
                             elseif(data(i,pks(j))>data(8,peaks(k))-800)
                                   cpp(k,i)=[.6];
                             elseif(data(i,pks(j))>data(8,peaks(k))-1200)
                                   cpp(k,i)=[.4];
                            else 
                                   cpp(k,i)=[.1];
                           
                           end
                           
                       end
                   end
                   
               end
                
            end
        end
        
end


end