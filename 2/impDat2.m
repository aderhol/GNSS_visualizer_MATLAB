function dat = impDat2(filename, startRow, endRow)
%IMPORTFILE Import numeric data from a text file as a matrix.
%   TESTVALIDATOR2MAXANDAVRROUND2 = IMPORTFILE(FILENAME) Reads data from
%   text file FILENAME for the default selection.
%
%   TESTVALIDATOR2MAXANDAVRROUND2 = IMPORTFILE(FILENAME, STARTROW, ENDROW)
%   Reads data from rows STARTROW through ENDROW of text file FILENAME.
%
% Example:
%   testvalidator2maxAndAvrround2 = importfile('test_validator_2_maxAndAvr_round-2.dat', 2, 170760);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2018/07/25 22:47:58

%% Initialize variables.
delimiter = '\t';
if nargin<=2
    startRow = 2;
    endRow = inf;
end

%% Format for each line of text:
%   column1: datetimes (%{yyyy/MM/dd HH:mm:ss}D)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
%   column5: double (%f)
%	column6: double (%f)
%   column7: double (%f)
%	column8: double (%f)
%   column9: double (%f)
%	column10: double (%f)
%   column11: double (%f)
%	column12: double (%f)
%   column13: double (%f)
%	column14: double (%f)
%   column15: double (%f)
%	column16: double (%f)
%   column17: double (%f)
%	column18: double (%f)
%   column19: double (%f)
%	column20: double (%f)
%   column21: double (%f)
%	column22: double (%f)
%   column23: double (%f)
%	column24: double (%f)
%   column25: double (%f)
%	column26: double (%f)
%   column27: double (%f)
%	column28: double (%f)
%   column29: double (%f)
%	column30: double (%f)
%   column31: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%{yyyy/MM/dd HH:mm:ss}D%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines', startRow(block)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
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

%% Create output variable
dat = table(dataArray{1:end-1}, 'VariableNames', {'timeUTC','PDOP_0','HDOP_0','VDOP_0','satelliteInView_0','satelliteInViewGPS_0','satelliteInViewGLONASS_0','satelliteUsed_0','satelliteUsedGPS_0','satelliteUsedGLONASS_0','maxSnr_0','maxSnrGPS_0','maxSnrGLONASS_0','avrSnr_0','avrSnrGPS_0','avrSnrGLONASS_0','PDOP_1','HDOP_1','VDOP_1','satelliteInView_1','satelliteInViewGPS_1','satelliteInViewGLONASS_1','satelliteUsed_1','satelliteUsedGPS_1','satelliteUsedGLONASS_1','maxSnr_1','maxSnrGPS_1','maxSnrGLONASS_1','avrSnr_1','avrSnrGPS_1','avrSnrGLONASS_1'});

% For code requiring serial dates (datenum) instead of datetime, uncomment
% the following line(s) below to return the imported dates as datenum(s).

% testvalidator2maxAndAvrround2.timeUTC=datenum(testvalidator2maxAndAvrround2.timeUTC);

