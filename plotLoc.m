function plotLoc(mode, des, dotSize_3D)
    global DEBUG;
    if(~DEBUG)
        plot2DScatter(mode, des);
        plot2DPath(mode, des);
        plot3DScatter(mode, des, dotSize_3D);
        plot3DPath(mode, des);
    end
end

