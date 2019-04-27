%Find all windows of type figure, which have an empty FileName attribute.
allPlots = findall(0, 'Type', 'figure');
% Close.
delete(allPlots);
clear allPlots;