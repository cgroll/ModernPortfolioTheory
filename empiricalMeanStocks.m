function [ empiricalMeanStocks ] = empiricalMeanStocks( valsMatrix, stockNames )
%EMPIRICALMEANTABLE calculate empirical mean of the returns and create a table
%
% Inputs:
%   valsMatrix    mxn matrix of stock returns
%   stockNames    stockNames as returned by splitTable or as character array
%
% Output:
%  empiricalMeanStocks table that contains the empirical means of the returns

    empiricalMeanStocks = array2table(mean(valsMatrix, 1));
    empiricalMeanStocks.Properties.VariableNames = cellstr(stockNames);
end

