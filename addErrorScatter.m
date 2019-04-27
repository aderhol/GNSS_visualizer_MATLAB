function addErrorScatter(ref, errorDotSize)
    global err;
    scatter(err.timeUTC, ones([1 numel(err.timeUTC)])*mean(ref), errorDotSize ,'filled', 'red');
end

