function plotSatellitesRelative(mode, des, errorDotSize, movMeanSampleSize)
    global dev;
    switch mode
        case 2
        case 3
        case 4
        case 5
        otherwise
            disp('plotSatellitesRelative: invalid mode');
            return;
    end
    
    figSatellitesRelative = figure;
    WindowAPI(figSatellitesRelative, 'Maximize');
    set(figSatellitesRelative, 'Name',  'Relative Satellites', 'numberTitle', 'off');
    subplot(3, 2, 1);
    dataset{1} = movFilter(dev.satelliteInView_1 * 100,  movMeanSampleSize);
    alldata = dataset{1};
    if mode > 2
        for i = 2:(mode-1)
            switch i
                case 2
                    temp = dev.satelliteInView_2;
                case 3
                    temp = dev.satelliteInView_3;
                case 4
                    temp = dev.satelliteInView_4;
            end
            dataset{i} = movFilter(temp * 100,  movMeanSampleSize);
            alldata = [alldata; dataset{i}];
        end
    end
    plot(dev.timeUTC, dataset{1}, 'Color', defColor(2));
    hold on;
    if mode > 2
        for i = 2:(mode-1)
            plot(dev.timeUTC, dataset{i}, 'Color', defColor(i + 1));
        end
    end
    addErrorScatter(nanmean(alldata), errorDotSize);
    hold off;
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Relative Error of the In-View Satellite Metrics'));
    legend([des(2:end) "error"],'Location','best');
    xlabel('UTC time');
    ylabel('Percentage Error [%]');
    xlim([dev.timeUTC(1) dev.timeUTC(end)]);   
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end
        
    subplot(3, 2, 3);
    dataset{1} = movFilter(dev.satelliteInViewGPS_1 * 100,  movMeanSampleSize);
    alldata = dataset{1};
    if mode > 2
        for i = 2:(mode-1)
            switch i
                case 2
                    temp = dev.satelliteInViewGPS_2;
                case 3
                    temp = dev.satelliteInViewGPS_3;
                case 4
                    temp = dev.satelliteInViewGPS_4;
            end
            dataset{i} = movFilter(temp * 100,  movMeanSampleSize);
            alldata = [alldata; dataset{i}];
        end
    end
    plot(dev.timeUTC, dataset{1}, 'Color', defColor(2));
    hold on;
    if mode > 2
        for i = 2:(mode-1)
            plot(dev.timeUTC, dataset{i}, 'Color', defColor(i + 1));
        end
    end
    addErrorScatter(nanmean(alldata), errorDotSize);
    hold off;
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Relative Error of the In-View GPS Satellite Metrics'));
    legend([des(2:end) "error"],'Location','best');
    xlabel('UTC time');
    ylabel('Percentage Error [%]');
    xlim([dev.timeUTC(1) dev.timeUTC(end)]);   
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end
        
    subplot(3, 2, 5);
    dataset{1} = movFilter(dev.satelliteInViewGLONASS_1 * 100,  movMeanSampleSize);
    alldata = dataset{1};
    if mode > 2
        for i = 2:(mode-1)
            switch i
                case 2
                    temp = dev.satelliteInViewGLONASS_2;
                case 3
                    temp = dev.satelliteInViewGLONASS_3;
                case 4
                    temp = dev.satelliteInViewGLONASS_4;
            end
            dataset{i} = movFilter(temp * 100,  movMeanSampleSize);
            alldata = [alldata; dataset{i}];
        end
    end
    plot(dev.timeUTC, dataset{1}, 'Color', defColor(2));
    hold on;
    if mode > 2
        for i = 2:(mode-1)
            plot(dev.timeUTC, dataset{i}, 'Color', defColor(i + 1));
        end
    end
    addErrorScatter(nanmean(alldata), errorDotSize);
    hold off;
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Relative Error of the In-View GLONASS Satellite Metrics'));
    legend([des(2:end) "error"],'Location','best');
    xlabel('UTC time');
    ylabel('Percentage Error [%]');
    xlim([dev.timeUTC(1) dev.timeUTC(end)]);   
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end
    
    
    
    subplot(3, 2, 2);
    dataset{1} = movFilter(dev.satelliteUsed_1 * 100,  movMeanSampleSize);
    alldata = dataset{1};
    if mode > 2
        for i = 2:(mode-1)
            switch i
                case 2
                    temp = dev.satelliteUsed_2;
                case 3
                    temp = dev.satelliteUsed_3;
                case 4
                    temp = dev.satelliteUsed_4;
            end
            dataset{i} = movFilter(temp * 100,  movMeanSampleSize);
            alldata = [alldata; dataset{i}];
        end
    end
    plot(dev.timeUTC, dataset{1}, 'Color', defColor(2));
    hold on;
    if mode > 2
        for i = 2:(mode-1)
            plot(dev.timeUTC, dataset{i}, 'Color', defColor(i + 1));
        end
    end
    addErrorScatter(nanmean(alldata), errorDotSize);
    hold off;
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Relative Error of the Used Satellite Metrics'));
    legend([des(2:end) "error"],'Location','best');
    xlabel('UTC time');
    ylabel('Percentage Error [%]');
    xlim([dev.timeUTC(1) dev.timeUTC(end)]);   
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end
        
    subplot(3, 2, 4);
    dataset{1} = movFilter(dev.satelliteUsedGPS_1 * 100,  movMeanSampleSize);
    alldata = dataset{1};
    if mode > 2
        for i = 2:(mode-1)
            switch i
                case 2
                    temp = dev.satelliteUsedGPS_2;
                case 3
                    temp = dev.satelliteUsedGPS_3;
                case 4
                    temp = dev.satelliteUsedGPS_4;
            end
            dataset{i} = movFilter(temp * 100,  movMeanSampleSize);
            alldata = [alldata; dataset{i}];
        end
    end
    plot(dev.timeUTC, dataset{1}, 'Color', defColor(2));
    hold on;
    if mode > 2
        for i = 2:(mode-1)
            plot(dev.timeUTC, dataset{i}, 'Color', defColor(i + 1));
        end
    end
    addErrorScatter(nanmean(alldata), errorDotSize);
    hold off;
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Relative Error of the Used GPS Satellite Metrics'));
    legend([des(2:end) "error"],'Location','best');
    xlabel('UTC time');
    ylabel('Percentage Error [%]');
    xlim([dev.timeUTC(1) dev.timeUTC(end)]);   
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end
        
    subplot(3, 2, 6);
    dataset{1} = movFilter(dev.satelliteUsedGLONASS_1 * 100,  movMeanSampleSize);
    alldata = dataset{1};
    if mode > 2
        for i = 2:(mode-1)
            switch i
                case 2
                    temp = dev.satelliteUsedGLONASS_2;
                case 3
                    temp = dev.satelliteUsedGLONASS_3;
                case 4
                    temp = dev.satelliteUsedGLONASS_4;
            end
            dataset{i} = movFilter(temp * 100,  movMeanSampleSize);
            alldata = [alldata; dataset{i}];
        end
    end
    plot(dev.timeUTC, dataset{1}, 'Color', defColor(2));
    hold on;
    if mode > 2
        for i = 2:(mode-1)
            plot(dev.timeUTC, dataset{i}, 'Color', defColor(i + 1));
        end
    end
    addErrorScatter(nanmean(alldata), errorDotSize);
    hold off;
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Relative Error of the Used GLONASS Satellite Metrics'));
    legend([des(2:end) "error"],'Location','best');
    xlabel('UTC time');
    ylabel('Percentage Error [%]');
    xlim([dev.timeUTC(1) dev.timeUTC(end)]);   
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end
end