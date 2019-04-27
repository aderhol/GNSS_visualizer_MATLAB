function plotSNRRelative(mode, des, errorDotSize, movMeanSampleSize)
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

    figSNRRelative = figure;
    WindowAPI(figSNRRelative, 'Maximize');
    set(figSNRRelative, 'Name',  'Relative SNR', 'numberTitle', 'off');


    subplot(3, 2, 1);
    dataset{1} = movFilter(dev.maxSnr_1,  movMeanSampleSize);
    alldata = dataset{1};
    if mode > 2
        for i = 2:(mode-1)
            switch i
                case 2
                    temp = dev.maxSnr_2;
                case 3
                    temp = dev.maxSnr_3;
                case 4
                    temp = dev.maxSnr_4;
            end
            dataset{i} = movFilter(temp,  movMeanSampleSize);
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
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Relative Error of the Maximum SNR Metrics'));
    legend([des(2:end) "error"],'Location','best');
    xlabel('UTC time');
    ylabel('Error [dB]');
    xlim([dev.timeUTC(1) dev.timeUTC(end)]);
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end

    subplot(3, 2, 3);
    dataset{1} = movFilter(dev.maxSnrGPS_1,  movMeanSampleSize);
    alldata = dataset{1};
    if mode > 2
        for i = 2:(mode-1)
            switch i
                case 2
                    temp = dev.maxSnrGPS_2;
                case 3
                    temp = dev.maxSnrGPS_3;
                case 4
                    temp = dev.maxSnrGPS_4;
            end
            dataset{i} = movFilter(temp,  movMeanSampleSize);
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
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Relative Error of the Maximum GPS SNR Metrics'));
    legend([des(2:end) "error"],'Location','best');
    xlabel('UTC time');
    ylabel('Error [dB]');
    xlim([dev.timeUTC(1) dev.timeUTC(end)]);
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end

    subplot(3, 2, 5);
    dataset{1} = movFilter(dev.maxSnrGLONASS_1,  movMeanSampleSize);
    alldata = dataset{1};
    if mode > 2
        for i = 2:(mode-1)
            switch i
                case 2
                    temp = dev.maxSnrGLONASS_2;
                case 3
                    temp = dev.maxSnrGLONASS_3;
                case 4
                    temp = dev.maxSnrGLONASS_4;
            end
            dataset{i} = movFilter(temp,  movMeanSampleSize);
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
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Relative Error of the Maximum GLONASS SNR Metrics'));
    legend([des(2:end) "error"],'Location','best');
    xlabel('UTC time');
    ylabel('Error [dB]');
    xlim([dev.timeUTC(1) dev.timeUTC(end)]);
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end



    subplot(3, 2, 2);
    dataset{1} = movFilter(dev.avrSnr_1,  movMeanSampleSize);
    alldata = dataset{1};
    if mode > 2
        for i = 2:(mode-1)
            switch i
                case 2
                    temp = dev.avrSnr_2;
                case 3
                    temp = dev.avrSnr_3;
                case 4
                    temp = dev.avrSnr_4;
            end
            dataset{i} = movFilter(temp,  movMeanSampleSize);
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
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Relative Error of the Average SNR Metrics'));
    legend([des(2:end) "error"],'Location','best');
    xlabel('UTC time');
    ylabel('Error [dB]');
    xlim([dev.timeUTC(1) dev.timeUTC(end)]);
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end

    subplot(3, 2, 4);
    dataset{1} = movFilter(dev.avrSnrGPS_1,  movMeanSampleSize);
    alldata = dataset{1};
    if mode > 2
        for i = 2:(mode-1)
            switch i
                case 2
                    temp = dev.avrSnrGPS_2;
                case 3
                    temp = dev.avrSnrGPS_3;
                case 4
                    temp = dev.avrSnrGPS_4;
            end
            dataset{i} = movFilter(temp,  movMeanSampleSize);
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
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Relative Error of the Average GPS SNR Metrics'));
    legend([des(2:end) "error"],'Location','best');
    xlabel('UTC time');
    ylabel('Error [dB]');
    xlim([dev.timeUTC(1) dev.timeUTC(end)]);
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end

    subplot(3, 2, 6);
    dataset{1} = movFilter(dev.avrSnrGLONASS_1,  movMeanSampleSize);
    alldata = dataset{1};
    if mode > 2
        for i = 2:(mode-1)
            switch i
                case 2
                    temp = dev.avrSnrGLONASS_2;
                case 3
                    temp = dev.avrSnrGLONASS_3;
                case 4
                    temp = dev.avrSnrGLONASS_4;
            end
            dataset{i} = movFilter(temp,  movMeanSampleSize);
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
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Relative Error of the Average GLONASS SNR Metrics'));
    legend([des(2:end) "error"],'Location','best');
    xlabel('UTC time');
    ylabel('Error [dB]');
    xlim([dev.timeUTC(1) dev.timeUTC(end)]);
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end
end