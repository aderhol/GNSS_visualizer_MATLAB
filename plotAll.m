function plotAll(mode, des, errorDotSize, movMeanSampleSize)
    global DEBUG;
    if(~DEBUG)
        plotLoc(mode, des, 10);
        plotErr(mode, des);
        plotOffset(mode, des, errorDotSize, movMeanSampleSize);
        plotDilution(mode, des, errorDotSize, movMeanSampleSize);
        plotSatellites(mode, des, errorDotSize, movMeanSampleSize);
        plotSatellitesRelative(mode, des, errorDotSize, movMeanSampleSize);
        plotSNR(mode, des, errorDotSize, movMeanSampleSize);
        plotSNRRelative(mode, des, errorDotSize, movMeanSampleSize);
        plotSnrDev(mode, des, errorDotSize, movMeanSampleSize);
    end
    if(DEBUG)
        global dat; 
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
        hold off;
        title(strcat(num2str(movMeanSampleSize/3600), '-hour Moving Mean of the Maximum SNR'));
        legend([des],'Location','best');
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
    %plotSnrDevDirect(mode, des, errorDotSize, movMeanSampleSize);
    %plotSandBox(mode, des, errorDotSize, movMeanSampleSize);
end

