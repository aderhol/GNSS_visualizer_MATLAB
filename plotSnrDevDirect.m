function plotSnrDevDirect(mode, des, errorDotSize, movMeanSampleSize)
    global dat;
    switch mode
        case 2
        case 3
        case 4
        case 5
        otherwise
            disp('plotSnrDevDirect: invalid mode');
            return;
    end

    figSNR = figure;
    WindowAPI(figSNR, 'Maximize');
    set(figSNR, 'Name',  'SNR Deviance', 'numberTitle', 'off');
    ref = dat.maxSnr_0;
    dataset{1} = movFilter(dat.maxSnr_1-ref,  movMeanSampleSize);
    alldata = dataset{1};
    if mode > 2
        for i = 2:(mode-1)
            switch i
                case 2
                    temp = dat.maxSnr_2;
                case 3
                    temp = dat.maxSnr_3;
                case 4
                    temp = dat.maxSnr_4;
            end
            dataset{i} = movFilter(temp - ref,  movMeanSampleSize);
            alldata = [alldata; dataset{i}];
        end
    end
    plot(dat.timeUTC, dataset{1}, 'Color', defColor(2));
    hold on;
    if mode > 2
        for i = 2:(mode-1)
            plot(dat.timeUTC, dataset{i}, 'Color', defColor(i + 1));
        end
    end
    addErrorScatter(nanmean(alldata), errorDotSize);
    hold off;
    title(strcat('A maximális SNR értékek referenciától való eltérésének ', num2str(movMeanSampleSize), ' szekundumos mozgó átlaga'));
    legend([des(2:end) "hiba"],'Location','best');
    xlabel('UTC id?');
    ylabel('C/N_{0} eltérés [dBHz]');
    xlim([dat.timeUTC(1) dat.timeUTC(end)]);
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end
end