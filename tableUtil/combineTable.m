function outputTable = combineTable(vals,stockNames,dates)
%COMBINETABLE Combines returns, stock names and dates to table
%
% Inputs:
%   vals        mxn matrix of stock returns
%   stockNames  stockNames as returned by splitTable or as character array
%   dates       dates as returned by splitTable or as character array
%
% Outputs:
%   outputTable table that combines all three components

outputTable = array2table(vals);
outputTable.Properties.VariableNames = cellstr(stockNames);
outputTable.Properties.RowNames = cellstr(dates);

end


