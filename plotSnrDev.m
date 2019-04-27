function plotSnrDev(mode, des, errorDotSize, movMeanSampleSize)
    global dev;
    switch mode
        case 2
        case 3
        case 4
        case 5
        otherwise
            disp('plotSnrDev: invalid mode');
            return;
    end
    
    figSNRDev = figure;
    WindowAPI(figSNRDev, 'Maximize');
    set(figSNRDev, 'Name',  'SNR Deviance', 'numberTitle', 'off');
    
    subplot(2, 1, 1);
    dataset{1} = movFilter(dev.SnrDevView_1,  movMeanSampleSize);
    alldata = dataset{1};
    if mode > 2
        for i = 2:(mode-1)
            switch i
                case 2
                    temp = dev.SnrDevView_2;
                case 3
                    temp = dev.SnrDevView_3;
                case 4
                    temp = dev.SnrDevView_4;
            end
            dataset{i} = movFilter(temp,  movMeanSampleSize);
            alldata = [alldata; dataset{i}];
        end
    end
    plot(dev.timeUTC, dataset{1}, 'Color', defColor(2));
    hold on;
    if mode > 2
        for i = 2:(mode - 1)
            plot(dev.timeUTC, dataset{i}, 'Color', defColor(i + 1));
        end
    end
    addErrorScatter(nanmean(alldata), errorDotSize);
    hold off;
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Mean Relative Error of the SNRs of the Satellites in View'));
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
    
    subplot(2, 1, 2);
    dataset{1} = movFilter(dev.SnrDevUsed_1,  movMeanSampleSize);
    alldata = dataset{1};
    if mode > 2
        for i = 2:(mode-1)
            switch i
                case 2
                    temp = dev.SnrDevUsed_2;
                case 3
                    temp = dev.SnrDevUsed_3;
                case 4
                    temp = dev.SnrDevUsed_4;
            end
            dataset{i} = movFilter(temp,  movMeanSampleSize);
            alldata = [alldata; dataset{i}];
        end
    end
    plot(dev.timeUTC, dataset{1}, 'Color', defColor(2));
    hold on;
    if mode > 2
        for i = 2:(mode - 1)
            plot(dev.timeUTC, dataset{i}, 'Color', defColor(i + 1));
        end
    end
    addErrorScatter(nanmean(alldata), errorDotSize);
    hold off;
    title(strcat(num2str(movMeanSampleSize), 's Moving Mean of the Mean Relative Error of the SNRs of the Used Satellites'));
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

