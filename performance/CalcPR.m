function [tablePR]= CalcPR(tableData,tableWeights)
%CalcPR calculates portfolio returns for given weights and return tables
%
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

% A1) check for equal matrix dimension
if ~all(size(tableData) == size(tableWeights))
   error('portf:dimMismatch','data matrix and weights matrix have different dimensions')
end

% A2) Check if weights sum up to 1 c.p.dates with function: "checkWeights"

checkWeights(tableWeights)
%**************************************************************************
% function: "splitTable" for the data table and the weights table

[vals, stockNames, dates] = splitTable(tableData);
[valsWeights, stockNamesWeights, datesWeights]=splitTable(tableWeights);
%**************************************************************************

% A3) check for equal dates
if ~all(isequal(dates,datesWeights))
   error ('portf:DateMismatch','Dates are not equal')
end

% A4) check for equal Stock names
if ~all (isequal(stockNames, stockNamesWeights))
   error ('portf:NamesMismatch','Stock names are not equal')
end

%**************************************************************************
% C) transform matrix format into table format with headers 'Date' and 
%'PortfRet'
arrayPR=sum(vals.*valsWeights,2);
tablePR=array2table(arrayPR);
tablePR.Properties.RowNames = cellstr(dates);
tablePR.Properties.VariableNames = cellstr('PortfRet');
end
