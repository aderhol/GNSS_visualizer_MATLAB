function saveAllFigures(directory, ext)
    if ~exist(directory, 'dir')
        mkdir(directory);
    end
    FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
    for iFig = 1:length(FigList)
      FigHandle = FigList(iFig);
      FigName   = get(FigHandle, 'Name');
      saveas(FigHandle, fullfile(directory, strcat(FigName, '.', ext)));
    end
end