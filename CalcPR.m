function [tablePR2]= CalcPR2(tableData,tableWeights)
%**************************************************************************
% General Information: 

% Inputs:
%  tableData      nxm table containing return data
%  tableWeights   nxm table containing weights data
%
% Outputs:
%  tablePR2       nx1 table containing portfolio returns
%
% data table and weights table have to have the same dimension and equally
% row and column names sorted in a cronological order
%**************************************************************************
% A) General data checks

% A1) Check if weights sum up to 1 c.p.dates with function: "checkWeights"

checkWeights(tableWeights)
%**************************************************************************
% function: "splitTable" for the data table and the weights table

[vals, stockNames, dates] = splitTable(tableData);
[valsWeights, stockNamesWeights, datesWeights]=splitTable(tableWeights);
%**************************************************************************

% A2) check for equal matrix dimension
if ~all(size(vals) == size(stockNames))
   error('data matrix and weights matrix have different dimensions')
end

% A3) check for equal dates
if ~all(dates == datesWeights)
   error ('Dates are not equal')
end

% A4) check for equal Stock names
if ~all (stockNames == stockNamesWeights)
   error ('Stock names are not equal')
end

%**************************************************************************
% C) transform matrix format into table format with headers 'Date' and 
%'PortfRet'

tablePR2=array2table(vals*valsWeights');
tablePR2.Properties.RowNames = cellstr(dates);
end
