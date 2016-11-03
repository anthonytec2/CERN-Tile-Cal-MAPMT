function [aDenoise]= pedestalSub(A)
m=[];
for i=1:48
    m(i)=mean(A(i,1:100));
    aDenoise(i,:)=A(i,:)-m(i);
end



end