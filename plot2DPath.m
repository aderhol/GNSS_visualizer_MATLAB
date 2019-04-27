function plot2DPath(mode, des)
    global loc;
    switch mode
        case 2
        case 3
        case 4
        case 5
        otherwise
            disp('plot2DPath: invalid mode');
            return;
    end
    
    figLoc2DPath= figure;
    WindowAPI(figLoc2DPath, 'Maximize');

    set(figLoc2DPath, 'Name',  '2D Location Path', 'numberTitle', 'off');

    plot(loc.longitude_0, loc.latitude_0, 'Color', defColor(1));
    hold on;

    plot(loc.longitude_1, loc.latitude_1, 'Color', defColor(2));
    if(mode > 2)
        plot(loc.longitude_2, loc.latitude_2, 'Color', defColor(3));
    end
    if(mode > 3)
        plot(loc.longitude_3, loc.latitude_3, 'Color', defColor(4));
    end
    if(mode > 4)
        plot(loc.longitude_4, loc.latitude_4, 'Color', defColor(5));
    end
    hold off;

    legend(des);
    ylabel('latitude');
    xlabel('longitude');
    title("2D Path of the Measured Locations");
    
end