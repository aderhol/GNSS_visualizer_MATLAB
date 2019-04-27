function plot2DScatter(mode, des)
    global loc;
    switch mode
        case 2
        case 3
        case 4
        case 5
        otherwise
            disp('plot2DScatter: invalid mode');
            return;
    end
    
    dotSize_2D = 15;
    figLoc2DScatter = figure;
    WindowAPI(figLoc2DScatter, 'Maximize');

    set(figLoc2DScatter, 'Name',  '2D Location Scatter', 'numberTitle', 'off');


    scatter(loc.longitude_0, loc.latitude_0, dotSize_2D, 'filled', 'CData', defColor(1));
    hold on;

    scatter(loc.longitude_1, loc.latitude_1, dotSize_2D, 'filled', 'CData', defColor(2));
    if(mode > 2)
        scatter(loc.longitude_2, loc.latitude_2, dotSize_2D, 'filled', 'CData', defColor(3));
    end
    if(mode > 3)
        scatter(loc.longitude_3, loc.latitude_3, dotSize_2D, 'filled', 'CData', defColor(4));
    end
    if(mode > 4)
        scatter(loc.longitude_4, loc.latitude_4, dotSize_2D, 'filled', 'CData', defColor(5));
    end
    hold off;

    legend(des);
    ylabel('latitude');
    xlabel('longitude');
    title("2D Scatter Plot of the Measured Locations");
end

