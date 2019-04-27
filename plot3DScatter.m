function plot3DScatter(mode, des, dotSize)
    global loc;
    switch mode
        case 2
        case 3
        case 4
        case 5
        otherwise
            disp('plot3DScatter: invalid mode');
            return;
    end
    
    figLoc3DScatter = figure;
    WindowAPI(figLoc3DScatter, 'Maximize');

    set(figLoc3DScatter, 'Name',  '3D Location Scatter', 'numberTitle', 'off');

    scatter3(loc.longitude_0, loc.latitude_0, loc.altitude_0, dotSize, 'filled', 'CData', defColor(1));
    hold on;

    scatter3(loc.longitude_1, loc.latitude_1, loc.altitude_1, dotSize, 'filled', 'CData', defColor(2));
    if(mode > 2)
        scatter3(loc.longitude_2, loc.latitude_2, loc.altitude_2, dotSize, 'filled', 'CData', defColor(3));
    end
    if(mode > 3)
        scatter3(loc.longitude_3, loc.latitude_3, loc.altitude_3, dotSize, 'filled', 'CData', defColor(4));
    end
    if(mode > 4)
        scatter3(loc.longitude_4, loc.latitude_4, loc.altitude_4, dotSize, 'filled', 'CData', defColor(5));
    end
    hold off;

    grid  on;
    legend(des);
    ylabel('latitude');
    xlabel('longitude');
    zlabel('altitude');
    title("3D Scatter Plot of the Measured Locations");
    
end