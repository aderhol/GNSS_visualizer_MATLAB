function out = movFilter(dataSet, sampleWindowWidth)
    out = movmean(dataSet,  sampleWindowWidth, 'omitnan');
end

