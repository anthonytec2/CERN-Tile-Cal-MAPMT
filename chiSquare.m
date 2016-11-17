function[error]= chiSquare(exp,the)

error=sum(((exp-the).^2)./(the));
end