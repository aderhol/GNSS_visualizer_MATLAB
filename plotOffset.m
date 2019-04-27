function plotOffset(mode, des, errorDotSize ,movMeanSampleSize)
    global dev;
    switch mode
        case 2
        case 3
        case 4
        case 5
        otherwise
            disp('plotOffset: invalid mode');
            return;
    end
    
    figOffset = figure;
    WindowAPI(figOffset, 'Maximize');

    dataset{1} = movFilter(dev.offset_1,  movMeanSampleSize);
    alldata = dataset{1};
    if(mode > 2)
        dataset{2} = movFilter(dev.offset_2,  movMeanSampleSize);
        alldata = [alldata; dataset{2}];
    end
    if(mode > 3)
        dataset{3} = movFilter(dev.offset_3,  movMeanSampleSize);
        alldata = [alldata; dataset{3}];
    end
    if(mode > 4)
        dataset{4} = movFilter(dev.offset_4,  movMeanSampleSize);
        alldata = [alldata; dataset{4}];
    end
    
    set(figOffset, 'Name',  'Offset', 'numberTitle', 'off');

    plot(dev.timeUTC, dataset{1}, 'Color', defColor(2));
    hold on;
    if mode > 2
        for i = 2:(mode - 1)
            plot(dev.timeUTC, dataset{i}, 'Color', defColor(i + 1));
        end
    end
    addErrorScatter(nanmean(alldata), errorDotSize);
    hold off;
    legend([des(2:end) "error"]);
    ylabel('3D Offset [m]');
    xlim([dev.timeUTC(1) dev.timeUTC(end)]);
    title(strcat(num2str(movMeanSampleSize),'s Moving Mean of the 3D Offset of the Devices Under Test from the Reference Device'));
    
end