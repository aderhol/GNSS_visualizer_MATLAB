function plotErr(mode, des)
    global err dat;
    
    figOffset = figure;
    WindowAPI(figOffset, 'Maximize');
    set(figOffset, 'Name',  'Error', 'numberTitle', 'off')
    
    maxEr = 0;
    minEr = 10;
    errIs = false;
    for recI = 1:length(des)
        receivers{1, recI} = err(err.device == recI & err.timeUTC > min(dat.timeUTC), [1 4]); %errors in the first second of data collection are not relevant becouse they are often just an anomaly caused by the way the collection is started
        receivers{1, recI}.code = arrayfun(@(x) uint8(log2(double(bitand(15, x)))), receivers{1, recI}.code);
        errIs = errIs || ~isempty(receivers{1, recI});
        maxEr = max([maxEr max(receivers{1, recI}.code)]);
        minEr = min([minEr min(receivers{1, recI}.code)]);
    end
    
    if(~errIs)
        return;
    end
    
    dotSize = 30;
    for i = 1:mode
        subplot(mode, 1, i);
        scatter(receivers{1, i}.timeUTC, receivers{1, i}.code, dotSize, 'filled', 'CData', defColor(i));
        ylabel('Type of Error');
        ylim([(double(minEr) - 0.5) (double(maxEr) + 0.5)]);
        yticks(0:4);
        yticklabels({'no-Fix','2D Fix','invalid', 'missing'})
        xlabel('UTC time');
        xlim([min(dat.timeUTC) max([max(dat.timeUTC) max(err.timeUTC)])]);
        title(strcat("Errors of ", des(i), " During the Measurement"));
    end
    
end