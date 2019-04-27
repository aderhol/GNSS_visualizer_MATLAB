function plotSandBox(mode, des, errorDotSize, movMeanSampleSize)
    global dat;
    switch mode
        case 2
        case 3
        case 4
        case 5
        otherwise
            disp('plotSandBox: invalid mode');
            return;
    end

    figSNR = figure('DefaultAxesFontSize', 25);
    WindowAPI(figSNR, 'Maximize');
    set(figSNR, 'Name',  'Sand Box', 'numberTitle', 'off');

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
    plot(dat.timeUTC, dataset{1}, 'Color', defColor(1),'LineWidth',4);
    hold on;
    plot(dat.timeUTC, dataset{2}, 'Color', defColor(2),'LineWidth',4);
    if mode > 2
        for i = 3:mode
            plot(dat.timeUTC, dataset{i}, 'Color', defColor(i),'LineWidth',4);
        end
    end
    addErrorScatter(nanmean(alldata), 100);
    hold off;
    title(strcat('A maximális SNR értékek ', num2str(movMeanSampleSize), ' szekundumos mozgó átlaga'));
    legend([des "hiba"],'Location','best');
    xlabel('UTC id?');
    ylabel('C/N_{0} [dBHz]');
    xlim([dat.timeUTC(1) dat.timeUTC(end)]);
    minV = nanmin(alldata);
    maxV = nanmax(alldata);
    FS = maxV - minV;
    if FS > 0
        ylim([(minV - FS * 0.05) (maxV + FS * 0.05)]);
    end
end