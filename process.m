function process(varargin)
    clc;

    addpath WindowAPI_20161126;
    addpath 2;
    addpath 3;
    addpath 5;
    savepath;
    
    if nargin < 4 || nargin < (2 + varargin{1}) || nargin > (3 + varargin{1})
        disp('Process: arg error');
        return;
    end
    
    mode = varargin{1};
    
    dataSetName = varargin{2};
    
    errorDotSize = 30;
    
    des = string(varargin(3:(2 + mode)));
    
    if nargin == (2 + mode)        
        movMeanSampleSize = 60;
    else
        movMeanSampleSize = varargin{end};
    end
    closeFigures;
    global DEBUG LOADFILES SAVEFIGURES;
    if(LOADFILES)
        loadAll(mode, dataSetName, des);
        LOADFILES = false;
        fprintf('Files have been loaded!\n');
    else
        fprintf('No files have been loaded!\n');
    end
    plotAll(mode, des, errorDotSize, movMeanSampleSize);
    if(SAVEFIGURES)
        saveAllFigures(strcat('..\',dataSetName,'\Results\'), 'svg');    
        saveAllFigures(strcat('..\',dataSetName,'\Results\'), 'fig');
         fprintf('Figures have been saved!\n');
    else
        fprintf('No figures have been saved!\n');
    end
end