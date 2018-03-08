function [Trigger,Time,A] = importTBdata(filename, startRow, endRow)


delimiter = '\t';
if nargin<=2
    startRow = 11;
    endRow = inf;
end

%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
textscan(fileID, '%[^\n\r]', startRow(1)-1, 'WhiteSpace', '', 'ReturnOnError', false);
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'ReturnOnError', false, 'EndOfLine', '\r\n');
for block=2:length(startRow)
    frewind(fileID);
    textscan(fileID, '%[^\n\r]', startRow(block)-1, 'WhiteSpace', '', 'ReturnOnError', false);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'ReturnOnError', false, 'EndOfLine', '\r\n');
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Convert the contents of columns containing numeric text to numbers.
% Replace non-numeric text with NaN.
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = dataArray{col};
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[1,2,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1);
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData{row}, regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if any(numbers==',');
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'));
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator;
                numbers = textscan(strrep(numbers, ',', ''), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch me
        end
    end
end


%% Split data into numeric and cell columns.
rawNumericColumns = raw(:, [1,2,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67]);
rawCellColumns = raw(:, 3);


%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),rawNumericColumns); % Find non-numeric cells
rawNumericColumns(R) = {NaN}; % Replace non-numeric cells

Trigger = rawCellColumns(:, 1);
Time = cell2mat(rawNumericColumns(:, 2));
%IMPORT EACH PMT PIXEL IN I,J,Triggers format 1,1 starts a col 3
A(1,1,:) = cell2mat(rawNumericColumns(:, 3));
A(1,2,:) = cell2mat(rawNumericColumns(:, 4));
A(1,3,:) = cell2mat(rawNumericColumns(:, 5));
A(1,4,:) = cell2mat(rawNumericColumns(:, 6));
A(1,5,:) = cell2mat(rawNumericColumns(:, 7));
A(1,6,:) = cell2mat(rawNumericColumns(:, 8));
A(1,7,:) = cell2mat(rawNumericColumns(:, 9));
A(1,8,:) = cell2mat(rawNumericColumns(:, 10));
 
A(2,1,:) = cell2mat(rawNumericColumns(:, 11));
A(2,2,:) = cell2mat(rawNumericColumns(:, 12));
A(2,3,:) = cell2mat(rawNumericColumns(:, 13));
A(2,4,:) = cell2mat(rawNumericColumns(:, 14));
A(2,5,:) = cell2mat(rawNumericColumns(:, 15));
A(2,6,:) = cell2mat(rawNumericColumns(:, 16));
A(2,7,:) = cell2mat(rawNumericColumns(:, 17));
A(2,8,:) = cell2mat(rawNumericColumns(:, 18));
 
A(3,1,:) = cell2mat(rawNumericColumns(:, 19));
A(3,2,:) = cell2mat(rawNumericColumns(:, 20));
A(3,3,:) = cell2mat(rawNumericColumns(:, 21));
A(3,4,:) = cell2mat(rawNumericColumns(:, 22));
A(3,5,:) = cell2mat(rawNumericColumns(:, 23));
A(3,6,:) = cell2mat(rawNumericColumns(:, 24));
A(3,7,:) = cell2mat(rawNumericColumns(:, 25));
A(3,8,:) = cell2mat(rawNumericColumns(:, 26));

A(4,1,:) = cell2mat(rawNumericColumns(:, 27));
A(4,2,:) = cell2mat(rawNumericColumns(:, 28));
A(4,3,:) = cell2mat(rawNumericColumns(:, 39));
A(4,4,:) = cell2mat(rawNumericColumns(:, 30));
A(4,5,:) = cell2mat(rawNumericColumns(:, 31));
A(4,6,:) = cell2mat(rawNumericColumns(:, 32));
A(4,7,:) = cell2mat(rawNumericColumns(:, 33));
A(4,8,:) = cell2mat(rawNumericColumns(:, 34));

A(5,1,:) = cell2mat(rawNumericColumns(:, 35));
A(5,2,:) = cell2mat(rawNumericColumns(:, 36));
A(5,3,:) = cell2mat(rawNumericColumns(:, 37));
A(5,4,:) = cell2mat(rawNumericColumns(:, 38));
A(5,5,:) = cell2mat(rawNumericColumns(:, 39));
A(5,6,:) = cell2mat(rawNumericColumns(:, 40));
A(5,7,:) = cell2mat(rawNumericColumns(:, 41));
A(5,8,:) = cell2mat(rawNumericColumns(:, 42));
 
A(6,1,:) = cell2mat(rawNumericColumns(:, 43));
A(6,2,:) = cell2mat(rawNumericColumns(:, 44));
A(6,3,:) = cell2mat(rawNumericColumns(:, 45));
A(6,4,:) = cell2mat(rawNumericColumns(:, 46));
A(6,5,:) = cell2mat(rawNumericColumns(:, 47));
A(6,6,:) = cell2mat(rawNumericColumns(:, 48));
A(6,7,:) = cell2mat(rawNumericColumns(:, 49));
A(6,8,:) = cell2mat(rawNumericColumns(:, 50));
 
A(7,1,:) = cell2mat(rawNumericColumns(:, 51));
A(7,2,:) = cell2mat(rawNumericColumns(:, 52));
A(7,3,:) = cell2mat(rawNumericColumns(:, 53));
A(7,4,:) = cell2mat(rawNumericColumns(:, 54));
A(7,5,:) = cell2mat(rawNumericColumns(:, 55));
A(7,6,:) = cell2mat(rawNumericColumns(:, 56));
A(7,7,:) = cell2mat(rawNumericColumns(:, 57));
A(7,8,:) = cell2mat(rawNumericColumns(:, 58));
 
A(8,1,:) = cell2mat(rawNumericColumns(:, 59));
A(8,2,:) = cell2mat(rawNumericColumns(:, 60));
A(8,3,:) = cell2mat(rawNumericColumns(:, 61));
A(8,4,:) = cell2mat(rawNumericColumns(:, 62));
A(8,5,:) = cell2mat(rawNumericColumns(:, 63));
A(8,6,:) = cell2mat(rawNumericColumns(:, 64));
A(8,7,:) = cell2mat(rawNumericColumns(:, 65));
A(8,8,:) = cell2mat(rawNumericColumns(:, 66));


