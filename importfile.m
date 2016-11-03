function [A,trigger] = importfile(filename, startRow, endRow)
%LOW Foward
%High Backward

%% Initialize variables.
delimiter = ',';
if nargin<=2
    startRow = 1;
    endRow = inf;
end
%	column44: double (%f)
%   column45: double (%f)
%	column46: double (%f)
%   column47: double (%f)
%	column48: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines', startRow(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines', startRow(block)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);
A=zeros(48,length(squeeze(dataArray{:, 1})));
%% 
trigger = dataArray{:, 1};
%% 
A(1,:) = dataArray{:, 2};
A(2,:) = dataArray{:, 3};
A(3,:) = dataArray{:, 4};
A(4,:) = dataArray{:, 5};
A(5,:) = dataArray{:, 6};
A(6,:) = dataArray{:, 7};
A(7,:) = dataArray{:, 8};
A(8,:) = dataArray{:, 9};
A(9,:) = dataArray{:, 10};
A(10,:) = dataArray{:, 11};
A(11,:) = dataArray{:, 12};
A(12,:) = dataArray{:, 13};
A(13,:) = dataArray{:, 14};
A(14,:) = dataArray{:, 15};
A(15,:) = dataArray{:, 16};
A(16,:) = dataArray{:, 17};
A(17,:) = dataArray{:, 18};
A(18,:) = dataArray{:, 19};
A(19,:) = dataArray{:, 20};
A(20,:) = dataArray{:, 21};
A(21,:) = dataArray{:, 22};
A(22,:) = dataArray{:, 23};
A(23,:) = dataArray{:, 24};
A(24,:) = dataArray{:, 25};
A(25,:) = dataArray{:, 26};
A(26,:) = dataArray{:, 27};
A(27,:) = dataArray{:, 28};
A(28,:) = dataArray{:, 29};
A(29,:) = dataArray{:, 30};
A(30,:) = dataArray{:, 31};
A(31,:) = dataArray{:, 32};
A(32,:) = dataArray{:, 33};
A(33,:) = dataArray{:, 34};
A(34,:) = dataArray{:, 35};
A(35,:) = dataArray{:, 36};
A(36,:) = dataArray{:, 37};
A(37,:) = dataArray{:, 38};
A(38,:) = dataArray{:, 39};
A(39,:) = dataArray{:, 40};
A(40,:) = dataArray{:, 41};
A(41,:) = dataArray{:, 42};
A(42,:) = dataArray{:, 43};
A(43,:) = dataArray{:, 44};
A(44,:) = dataArray{:, 45};
A(45,:) = dataArray{:, 46};
A(46,:) = dataArray{:, 47};
A(47,:) = dataArray{:, 48};
A(48,:) = dataArray{:, 49};



