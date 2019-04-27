function plotSNR(mode, des, errorDotSize, movMeanSampleSize)
    global dat;
    switch mode
        case 2
        case 3
        case 4
        case 5
        otherwise
            disp('plotSNR: invalid mode');
            return;
    end

    figSNR = figure;
    WindowAPI(figSNR, 'Maximize');
    set(figSNR, 'Name',  'SNR Metrics', 'numberTitle', 'off');

    subplot(3, 2, 1);
    dataset{1} = movFilter(dat.maxSnr_0,  movMeanSampleSize);
    alldata = dataset{1};
    dataset{2} = movFilter(dat.maxSnr_1,  movMeanSampleSize);
    alldata = [alldata; dataset{2}];
    if mode > 2
        for i = 3:mode
            switch (i-1)
                case 2
                    temp = dat.maxSnr_2;
                case 3
                    temp = dat.maxSnr_3;
                case 4
                    temp = dat.maxSnr_4;
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
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Maximum SNR'));
    legend([des "error"],'Location','best');
    xlabel('UTC time');
    ylabel('C/N_{0} [dBHz]');
    xlim([dat.timeUTC(1) dat.timeUTC(end)]);
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end

    subplot(3, 2, 3);
    dataset{1} = movFilter(dat.maxSnrGPS_0,  movMeanSampleSize);
    alldata = dataset{1};
    dataset{2} = movFilter(dat.maxSnrGPS_1,  movMeanSampleSize);
    alldata = [alldata; dataset{2}];
    if mode > 2
        for i = 3:mode
            switch (i-1)
                case 2
                    temp = dat.maxSnrGPS_2;
                case 3
                    temp = dat.maxSnrGPS_3;
                case 4
                    temp = dat.maxSnrGPS_4;
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
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Maximum SNR of the GPS Satellites'));
    legend([des "error"],'Location','best');
    xlabel('UTC time');
    ylabel('C/N_{0} [dBHz]');
    xlim([dat.timeUTC(1) dat.timeUTC(end)]);
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end

    subplot(3, 2, 5);
    dataset{1} = movFilter(dat.maxSnrGLONASS_0,  movMeanSampleSize);
    alldata = dataset{1};
    dataset{2} = movFilter(dat.maxSnrGLONASS_1,  movMeanSampleSize);
    alldata = [alldata; dataset{2}];
    if mode > 2
        for i = 3:mode
            switch (i-1)
                case 2
                    temp = dat.maxSnrGLONASS_2;
                case 3
                    temp = dat.maxSnrGLONASS_3;
                case 4
                    temp = dat.maxSnrGLONASS_4;
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
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Maximum SNR of the GLONASS Satellites'));
    legend([des "error"],'Location','best');
    xlabel('UTC time');
    ylabel('C/N_{0} [dBHz]');
    xlim([dat.timeUTC(1) dat.timeUTC(end)]);
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end



    subplot(3, 2, 2);
    dataset{1} = movFilter(dat.avrSnr_0,  movMeanSampleSize);
    alldata = dataset{1};
    dataset{2} = movFilter(dat.avrSnr_1,  movMeanSampleSize);
    alldata = [alldata; dataset{2}];
    if mode > 2
        for i = 3:mode
            switch (i-1)
                case 2
                    temp = dat.avrSnr_2;
                case 3
                    temp = dat.avrSnr_3;
                case 4
                    temp = dat.avrSnr_4;
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
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Average SNR'));
    legend([des "error"],'Location','best');
    xlabel('UTC time');
    ylabel('C/N_{0} [dBHz]');
    xlim([dat.timeUTC(1) dat.timeUTC(end)]);
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end

    subplot(3, 2, 4);
    dataset{1} = movFilter(dat.avrSnrGPS_0,  movMeanSampleSize);
    alldata = dataset{1};
    dataset{2} = movFilter(dat.avrSnrGPS_1,  movMeanSampleSize);
    alldata = [alldata; dataset{2}];
    if mode > 2
        for i = 3:mode
            switch (i-1)
                case 2
                    temp = dat.avrSnrGPS_2;
                case 3
                    temp = dat.avrSnrGPS_3;
                case 4
                    temp = dat.avrSnrGPS_4;
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
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Average SNR of the GPS Satellites'));
    legend([des "error"],'Location','best');
    xlabel('UTC time');
    ylabel('C/N_{0} [dBHz]');
    xlim([dat.timeUTC(1) dat.timeUTC(end)]);
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end

    subplot(3, 2, 6);
    dataset{1} = movFilter(dat.avrSnrGLONASS_0,  movMeanSampleSize);
    alldata = dataset{1};
    dataset{2} = movFilter(dat.avrSnrGLONASS_1,  movMeanSampleSize);
    alldata = [alldata; dataset{2}];
    if mode > 2
        for i = 3:mode
            switch (i-1)
                case 2
                    temp = dat.avrSnrGLONASS_2;
                case 3
                    temp = dat.avrSnrGLONASS_3;
                case 4
                    temp = dat.avrSnrGLONASS_4;
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
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Average SNR of the GLONASS Satellites'));
    legend([des "error"],'Location','best');
    xlabel('UTC time');
    ylabel('C/N_{0} [dBHz]');
    xlim([dat.timeUTC(1) dat.timeUTC(end)]);
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end

end