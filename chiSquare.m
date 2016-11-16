function[error]= chiSquare(exp,the)

error=sum((((the-exp).^2)/(the-exp))/(length(exp(1,1,:))));
end