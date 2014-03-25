function [vals,stockNames,dates] = splitTable( inputTable )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
vals = table2array(inputTable);
stockNames = inputTable.Properties.VariableNames;
dates = inputTable.Properties.RowNames;
end

