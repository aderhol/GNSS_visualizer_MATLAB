function colorVec = defColor(seqNum)
    switch seqNum
        case 1
            colorVec = [0, 0.4470, 0.7410];
        case 2
            colorVec = [0.8500, 0.3250, 0.0980];
        case 3
            colorVec = [0.9290, 0.6940, 0.1250];
        case 4
            colorVec = [0.4940, 0.1840, 0.5560];
        case 5
            colorVec = [0.4660, 0.6740, 0.1880];
        case 6
            colorVec = [0.3010, 0.7450, 0.9330];
        case 7
            colorVec = [0.6350, 0.0780, 0.1840];
        otherwise
            if seqNum < 1
                disp('colorVec: seqNum is negative or zero, seqNum must be between 1 and 7 -> [1 ,7]');
            elseif seqNum > 7
                disp('colorVec: seqNum is greater than 7, seqNum must be between 1 and 7 -> [1 ,7]');
            else
                disp('colorVec: invalid seqNum, unkown error');
            end
    end
end

