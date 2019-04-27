function plotSatellites(mode, des, errorDotSize, movMeanSampleSize)
    global dat;
    switch mode
        case 2
        case 3
        case 4
        case 5
        otherwise
            disp('plotSatellites: invalid mode');
            return;
    end
    
    figSatellites = figure;
    WindowAPI(figSatellites, 'Maximize');
    set(figSatellites, 'Name',  'Satellites', 'numberTitle', 'off');
    
    subplot(3, 2, 1);
    dataset{1} = movFilter(dat.satelliteInView_0,  movMeanSampleSize);
    alldata = dataset{1};
    dataset{2} = movFilter(dat.satelliteInView_1,  movMeanSampleSize); 
    alldata = [alldata; dataset{2}];
    if mode > 2
        for i = 3:mode
            switch (i - 1)
                case 2
                    temp = dat.satelliteInView_2;
                case 3
                    temp = dat.satelliteInView_3;
                case 4
                    temp = dat.satelliteInView_4;
            end
            dataset{i} = movFilter(temp,  movMeanSampleSize);
            alldata = [alldata; dataset{i}];
        end
    end
    plot(dat.timeUTC, dataset{1}, 'Color', defColor(1));
    hold on;
    plot(dat.timeUTC, dataset{2}, 'Color', defColor(2));
    if mode > 2
        for i = 3:mode
            plot(dat.timeUTC, dataset{i}, 'Color', defColor(i));
        end
    end
    addErrorScatter(nanmean(alldata), errorDotSize);
    hold off;
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Number of Satellites in View'));
    legend([des "error"],'Location','best');
    xlabel('UTC time');
    ylabel('Number of Satellites');
    xlim([dat.timeUTC(1) dat.timeUTC(end)]);   
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end
        
    subplot(3, 2, 3);
    dataset{1} = movFilter(dat.satelliteInViewGPS_0,  movMeanSampleSize);
    alldata = dataset{1};
    dataset{2} = movFilter(dat.satelliteInViewGPS_1,  movMeanSampleSize);
    alldata = [alldata; dataset{2}];
    if mode > 2
        for i = 3:mode
            switch (i - 1)
                case 2
                    temp = dat.satelliteInViewGPS_2;
                case 3
                    temp = dat.satelliteInViewGPS_3;
                case 4
                    temp = dat.satelliteInViewGPS_4;
            end
            dataset{i} = movFilter(temp,  movMeanSampleSize);
            alldata = [alldata; dataset{i}];
        end
    end
    plot(dat.timeUTC, dataset{1}, 'Color', defColor(1));
    hold on;
    plot(dat.timeUTC, dataset{2}, 'Color', defColor(2));
    if mode > 2
        for i = 3:mode
            plot(dat.timeUTC, dataset{i}, 'Color', defColor(i));
        end
    end
    addErrorScatter(nanmean(alldata), errorDotSize);
    hold off;
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Number of GPS Satellites in View'));
    legend([des "error"],'Location','best');
    xlabel('UTC time');
    ylabel('Number of Satellites');
    xlim([dat.timeUTC(1) dat.timeUTC(end)]);   
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end
        
    subplot(3, 2, 5);
    dataset{1} = movFilter(dat.satelliteInViewGLONASS_0,  movMeanSampleSize);
    alldata = dataset{1};
    dataset{2} = movFilter(dat.satelliteInViewGLONASS_1,  movMeanSampleSize);
    alldata = [alldata; dataset{2}];
    if mode > 2
        for i = 3:mode
            switch (i - 1)
                case 2
                    temp = dat.satelliteInViewGLONASS_2;
                case 3
                    temp = dat.satelliteInViewGLONASS_3;
                case 4
                    temp = dat.satelliteInViewGLONASS_4;
            end
            dataset{i} = movFilter(temp,  movMeanSampleSize);
            alldata = [alldata; dataset{i}];
        end
    end
    plot(dat.timeUTC, dataset{1}, 'Color', defColor(1));
    hold on;
    plot(dat.timeUTC, dataset{2}, 'Color', defColor(2));
    if mode > 2
        for i = 3:mode
            plot(dat.timeUTC, dataset{i}, 'Color', defColor(i));
        end
    end
    addErrorScatter(nanmean(alldata), errorDotSize);
    hold off;
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Number of GLONASS Satellites in View'));
    legend([des "error"],'Location','best');
    xlabel('UTC time');
    ylabel('Number of Satellites');
    xlim([dat.timeUTC(1) dat.timeUTC(end)]);   
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)])
    end
    
    
    
    subplot(3, 2, 2);
    dataset{1} = movFilter(dat.satelliteUsed_0,  movMeanSampleSize);
    alldata = dataset{1};
    dataset{2} = movFilter(dat.satelliteUsed_1,  movMeanSampleSize);
    alldata = [alldata; dataset{2}];
    if mode > 2
        for i = 3:mode
            switch (i - 1)
                case 2
                    temp = dat.satelliteUsed_2;
                case 3
                    temp = dat.satelliteUsed_3;
                case 4
                    temp = dat.satelliteUsed_4;
            end
            dataset{i} = movFilter(temp,  movMeanSampleSize);
            alldata = [alldata; dataset{i}];
        end
    end
    plot(dat.timeUTC, dataset{1}, 'Color', defColor(1));
    hold on;
    plot(dat.timeUTC, dataset{2}, 'Color', defColor(2));
    if mode > 2
        for i = 3:mode
            plot(dat.timeUTC, dataset{i}, 'Color', defColor(i));
        end
    end
    addErrorScatter(nanmean(alldata), errorDotSize);
    hold off;
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Number of Used Satellites'));
    legend([des "error"],'Location','best');
    xlabel('UTC time');
    ylabel('Number of Satellites');
    xlim([dat.timeUTC(1) dat.timeUTC(end)]);   
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)])
    end
        
    subplot(3, 2, 4);
    dataset{1} = movFilter(dat.satelliteUsedGPS_0,  movMeanSampleSize);
    alldata = dataset{1};
    dataset{2} = movFilter(dat.satelliteUsedGPS_1,  movMeanSampleSize);
    alldata = [alldata; dataset{2}];
    if mode > 2
        for i = 3:mode
            switch (i - 1)
                case 2
                    temp = dat.satelliteUsedGPS_2;
                case 3
                    temp = dat.satelliteUsedGPS_3;
                case 4
                    temp = dat.satelliteUsedGPS_4;
            end
            dataset{i} = movFilter(temp,  movMeanSampleSize);
            alldata = [alldata; dataset{i}];
        end
    end
    plot(dat.timeUTC, dataset{1}, 'Color', defColor(1));
    hold on;
    plot(dat.timeUTC, dataset{2}, 'Color', defColor(2));
    if mode > 2
        for i = 3:mode
            plot(dat.timeUTC, dataset{i}, 'Color', defColor(i));
        end
    end
    addErrorScatter(nanmean(alldata), errorDotSize);
    hold off;
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Number of Used GPS Satellites'));
    legend([des "error"],'Location','best');
    xlabel('UTC time');
    ylabel('Number of Satellites');
    xlim([dat.timeUTC(1) dat.timeUTC(end)]);   
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)])
    end
        
    subplot(3, 2, 6);
    dataset{1} = movFilter(dat.satelliteUsedGLONASS_0,  movMeanSampleSize);
    alldata = dataset{1};
    dataset{2} = movFilter(dat.satelliteUsedGLONASS_1,  movMeanSampleSize);
    alldata = [alldata; dataset{2}];
    if mode > 2
        for i = 3:mode
            switch (i - 1)
                case 2
                    temp = dat.satelliteUsedGLONASS_2;
                case 3
                    temp = dat.satelliteUsedGLONASS_3;
                case 4
                    temp = dat.satelliteUsedGLONASS_4;
            end
            dataset{i} = movFilter(temp,  movMeanSampleSize);
            alldata = [alldata; dataset{i}];
        end
    end
    plot(dat.timeUTC, dataset{1}, 'Color', defColor(1));
    hold on;
    plot(dat.timeUTC, dataset{2}, 'Color', defColor(2));
    if mode > 2
        for i = 3:mode
            plot(dat.timeUTC, dataset{i}, 'Color', defColor(i));
        end
    end
    addErrorScatter(nanmean(alldata), errorDotSize);
    hold off;
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Number of Used GLONASS Satellites'));
    legend([des "error"],'Location','best');
    xlabel('UTC time');
    ylabel('Number of Satellites');
    xlim([dat.timeUTC(1) dat.timeUTC(end)]);   
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)])
    end
end