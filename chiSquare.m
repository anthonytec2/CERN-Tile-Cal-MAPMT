%Implemented Function to Evaluate the Chi^2 of the data to theory
%comparsion
%EXP is the input to the function data series\
%THe is the theoritcal input 
%Returns the Error of the two
function[error]= chiSquare(exp,the)

error=sum(((exp-the).^2)./(the));
end