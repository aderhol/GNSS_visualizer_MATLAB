function loadAll(mode, dataSetName, des)
    filenameDat = strcat('..\',dataSetName,'\',dataSetName,'.dat');
    filenameDev = strcat('..\',dataSetName,'\',dataSetName,'.dev');
    filenameErr = strcat('..\',dataSetName,'\',dataSetName,'.err');
    filenameLoc = strcat('..\',dataSetName,'\',dataSetName,'.loc');
    global dat dev err loc;
    switch mode
        case 2
            dat = impDat2(filenameDat);
            dev = impDev2(filenameDev);
            err = impErr(filenameErr, des);
            loc = impLoc2(filenameLoc);
        case 3
            dat = impDat3(filenameDat);
            dev = impDev3(filenameDev);
            err = impErr(filenameErr, des);
            loc = impLoc3(filenameLoc);
        case 5            
            dat = impDat5(filenameDat);
            dev = impDev5(filenameDev);
            err = impErr(filenameErr, des);
            loc = impLoc5(filenameLoc);
        otherwise
            disp('loadAll: invalid mode');
    end
end