function plot3DPath(mode, des, dotSize)
    global loc;
    switch mode
        case 2
        case 3
        case 4
        case 5
        otherwise
            disp('plot3DPath: invalid mode');
            return;
    end
    
    figLoc3DPath = figure;
    WindowAPI(figLoc3DPath, 'Maximize');

    set(figLoc3DPath, 'Name',  '3D Location Path', 'numberTitle', 'off');

    plot3(loc.longitude_0, loc.latitude_0, loc.altitude_0, 'Color', defColor(1));
    hold on;

    plot3(loc.longitude_1, loc.latitude_1, loc.altitude_1, 'Color', defColor(2));
    if mode > 2
        plot3(loc.longitude_2, loc.latitude_2, loc.altitude_2, 'Color', defColor(3));
    end
    if mode > 3
        plot3(loc.longitude_3, loc.latitude_3, loc.altitude_3, 'Color', defColor(4));
    end
    if mode > 4
        plot3(loc.longitude_4, loc.latitude_4, loc.altitude_4, 'Color', defColor(5));
    end
    hold off;

    grid  on;
    legend(des);
    ylabel('latitude');
    xlabel('longitude');
    zlabel('altitude');
    title("3D Path of the Measured Locations");
end