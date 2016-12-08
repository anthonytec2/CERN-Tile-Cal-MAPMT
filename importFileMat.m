function [A,Acrop,old,cropOld] = importFileMat(filename, mapF)
%EO is Even or ODD used to tell if the scan if backwards or fowards
%Based of the above then different crops are taken
%A is the full data matrix 48 Channels converted to a 8x8 matric
%Acrop has a cropping defined based on the max value
%Old is the old PMT daa
%cropOld is the same cropping from A crop applied to old
if(mod(str2double(filename(8:12)),2)==0)%8-12 is the file name number
   EO=1; 
    
else
    EO=0;
end
mapping=importfileMapping(mapF);%Imports mapping file 8x8 space seperated matrix
%% Initialize variables.
delimiter = ',';%Delimeter used for txt file converted from root
%Format: Trigger#,Channel 1,Channel 2,...,Channel 48

    startRow = 1;
    endRow = inf;



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

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.
A=zeros(8,8,length(dataArray{:, 1}));%Allocating 8x8 Array
%% Allocate imported array to column variable names
for i=1:8
    for j=1:8
        if mapping(i,j)==0%Check if nothing in mapping 
       
        else
        A(i,j,:)=dataArray{:,mapping(i,j)+1}-mean(dataArray{:,mapping(i,j)+1}(1:100));%Remove Pedestal(First 100 Samples) and Assign to A pixel location
        end
    end
end
old=dataArray{:,6};%Get Data for old PMT MAY CHANGE
old=old-mean(old(1:100));
[Acrop,cropOld]= crop(A,EO,old);%Apply cropping

