function plotDilution(mode, des, errorDotSize, movMeanSampleSize)
    global dev dat;
    switch mode
        case 2
        case 3
        case 4
        case 5
        otherwise
            disp('plotDilution: invalid mode');
            return;
    end
    
    figDOP = figure;
    WindowAPI(figDOP, 'Maximize');

    set(figDOP, 'Name',  'Dilution of Precision', 'numberTitle', 'off');

    subplot(2, 3, 1);
    dataset{1} = movFilter(dev.PDOP_1 * 100,  movMeanSampleSize);
    alldata = dataset{1};
    if(mode > 2)
        dataset{2} = movFilter(dev.PDOP_2 * 100,  movMeanSampleSize);
        alldata = [alldata; dataset{2}];
    end
    if(mode > 3)
        dataset{3} = movFilter(dev.PDOP_3 * 100,  movMeanSampleSize);
        alldata = [alldata; dataset{3}];
    end
    if(mode > 4)
        dataset{4} = movFilter(dev.PDOP_4 * 100,  movMeanSampleSize);
        alldata = [alldata; dataset{4}];
    end
    plot(dev.timeUTC, dataset{1}, 'Color', defColor(2));
    hold on;
    if mode > 2
        for i = 2: (mode - 1)
            plot(dev.timeUTC, dataset{i}, 'Color', defColor(i + 1));
        end
    end
    addErrorScatter(nanmean(alldata), errorDotSize);
    hold off;
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Position Dilution of Precision''s Relative Error'));
    legend([des(2:end) "error"]);
    xlabel('UTC time');
    ylabel('Percentage Error [%]');
    xlim([dev.timeUTC(1) dev.timeUTC(end)]);   
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end

    subplot(2, 3, 2);
    dataset{1} = movFilter(dev.HDOP_1 * 100,  movMeanSampleSize);
    alldata = dataset{1};
    if(mode > 2)
        dataset{2} = movFilter(dev.HDOP_2 * 100,  movMeanSampleSize);
        alldata = [alldata; dataset{2}];
    end
    if(mode > 3)
        dataset{3} = movFilter(dev.HDOP_3 * 100,  movMeanSampleSize);
        alldata = [alldata; dataset{3}];
    end
    if(mode > 4)
        dataset{4} = movFilter(dev.HDOP_4 * 100,  movMeanSampleSize);
        alldata = [alldata; dataset{4}];
    end
    plot(dev.timeUTC, dataset{1}, 'Color', defColor(2));
    hold on;
    if mode > 2
        for i = 2: (mode - 1)
            plot(dev.timeUTC, dataset{i}, 'Color', defColor(i + 1));
        end
    end
    addErrorScatter(nanmean(alldata), errorDotSize);
    hold off;
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Relative Horizontal Dilution of Precision'));
    legend([des(2:end) "error"]);
    xlabel('UTC time');
    ylabel('Percentage Error [%]');
    xlim([dev.timeUTC(1) dev.timeUTC(end)]);   
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end

    subplot(2, 3, 3);
    dataset{1} = movFilter(dev.VDOP_1 * 100,  movMeanSampleSize);
    alldata = dataset{1};
    if(mode > 2)
        dataset{2} = movFilter(dev.VDOP_2 * 100,  movMeanSampleSize);
        alldata = [alldata; dataset{2}];
    end
    if(mode > 3)
        dataset{3} = movFilter(dev.VDOP_3 * 100,  movMeanSampleSize);
        alldata = [alldata; dataset{3}];
    end
    if(mode > 4)
        dataset{4} = movFilter(dev.VDOP_4 * 100,  movMeanSampleSize);
        alldata = [alldata; dataset{4}];
    end
    plot(dev.timeUTC, dataset{1}, 'Color', defColor(2));
    hold on;
    if mode > 2
        for i = 2: (mode - 1)
            plot(dev.timeUTC, dataset{i}, 'Color', defColor(i + 1));
        end
    end
    addErrorScatter(nanmean(alldata), errorDotSize);
    hold off;
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Relative Vertical Dilution of Precision'));
    legend([des(2:end) "error"]);
    xlabel('UTC time');
    ylabel('Percentage Error [%]');
    xlim([dev.timeUTC(1) dev.timeUTC(end)]);   
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end


    subplot(2, 3, 4);
    dataset{1} = movFilter(dat.PDOP_0,  movMeanSampleSize);
    alldata = dataset{1};
    dataset{2} = movFilter(dat.PDOP_1,  movMeanSampleSize);
    alldata = [alldata; dataset{2}];
    if mode > 2
        dataset{3} = movFilter(dat.PDOP_2,  movMeanSampleSize);
        alldata = [alldata; dataset{3}];
    end
    if mode > 3
        dataset{4} = movFilter(dat.PDOP_3,  movMeanSampleSize);
        alldata = [alldata; dataset{4}];
    end
    if mode > 4
        dataset{5} = movFilter(dat.PDOP_4,  movMeanSampleSize);
        alldata = [alldata; dataset{5}];
    end
    plot(dat.timeUTC, dataset{1}, 'Color', defColor(1));
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Position Dilution of Precision'));
    xlabel('UTC time');
    ylabel('Position Dilution of Precision');
    hold on;
    plot(dat.timeUTC, dataset{2}, 'Color', defColor(2));
    if mode > 2
        for i = 3:mode
            plot(dat.timeUTC, dataset{i}, 'Color', defColor(i));
        end
    end
    addErrorScatter(nanmean(alldata), errorDotSize);
    legend([des "error"]);
    hold off;
    xlim([dat.timeUTC(1) dat.timeUTC(end)]);
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end


    subplot(2, 3, 5);
    dataset{1} = movFilter(dat.HDOP_0,  movMeanSampleSize);
    alldata = dataset{1};
    dataset{2} = movFilter(dat.HDOP_1,  movMeanSampleSize);
    alldata = [alldata; dataset{2}];
    if mode > 2
        dataset{3} = movFilter(dat.HDOP_2,  movMeanSampleSize);
        alldata = [alldata; dataset{3}];
    end
    if mode > 3
        dataset{4} = movFilter(dat.HDOP_3,  movMeanSampleSize);
        alldata = [alldata; dataset{4}];
    end
    if mode > 4
        dataset{5} = movFilter(dat.HDOP_4,  movMeanSampleSize);
        alldata = [alldata; dataset{5}];
    end
    plot(dat.timeUTC, dataset{1}, 'Color', defColor(1));
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Horizontal Dilution of Precision'));
    xlabel('UTC time');
    ylabel('Horizontal Dilution of Precision');
    hold on;
    plot(dat.timeUTC, dataset{2}, 'Color', defColor(2));
    if mode > 2
        for i = 3:mode
            plot(dat.timeUTC, dataset{i}, 'Color', defColor(i));
        end
    end
    addErrorScatter(nanmean(alldata), errorDotSize);
    legend([des "error"]);
    hold off;
    xlim([dat.timeUTC(1) dat.timeUTC(end)]);
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end


    subplot(2, 3, 6);
    dataset{1} = movFilter(dat.VDOP_0,  movMeanSampleSize);
    alldata = dataset{1};
    dataset{2} = movFilter(dat.VDOP_1,  movMeanSampleSize); 
    alldata = [alldata; dataset{2}];
    if mode > 2
        dataset{3} = movFilter(dat.VDOP_2,  movMeanSampleSize);
        alldata = [alldata; dataset{3}];
    end
    if mode > 3
        dataset{4} = movFilter(dat.VDOP_3,  movMeanSampleSize);
        alldata = [alldata; dataset{4}];
    end
    if mode > 4
        dataset{5} = movFilter(dat.VDOP_4,  movMeanSampleSize);
        alldata = [alldata; dataset{5}];
    end
    plot(dat.timeUTC, dataset{1}, 'Color', defColor(1));
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Vertical Dilution of Precision'));
    xlabel('UTC time');
    ylabel('Vertical Dilution of Precision');
    hold on;
    plot(dat.timeUTC, dataset{2}, 'Color', defColor(2));
    if mode > 2
        for i = 3:mode
            plot(dat.timeUTC, dataset{i}, 'Color', defColor(i));
        end
    end
    addErrorScatter(nanmean(alldata), errorDotSize);
    legend([des "error"]);
    hold off;
    xlim([dat.timeUTC(1) dat.timeUTC(end)]);    
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end
end