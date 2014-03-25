function outputTable = combineTable(vals,stockNames,dates)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
outputTable = array2table(vals);
outputTable.Properties.VariableNames = cellstr(stockNames);
outputTable.Properties.RowNames = cellstr(dates);
end


