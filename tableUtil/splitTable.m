function [vals, stockNames, dates] = splitTable(tableData)
%SPLITTABLE Split table into individual components
%
% Inputs:
%   tableData   table containing stock returns with data and names
%
% Outputs:
%   vals        mxn matrix of return data
%   stockNames  1xn cell array of stock names
%   dates       mx1 cell array of dates as strings

vals = table2array(tableData);
stockNames = tableData.Properties.VariableNames;
dates = tableData.Properties.RowNames;
end

