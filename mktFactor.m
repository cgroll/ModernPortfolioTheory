function [ mktFactor ] = mktFactor( valsMatrix, dates )
%mktFactor calculate empirical mean of the returns for each stock and create a table
%
% Inputs:
%   valsMatrix    mxn matrix of stock returns
%   dates         dates as returned by splitTable or as character array
%
% Output:
%  mktFactor      table that contains the empirical means of the returns
%                 for each stock and the dates

    mktFactor = array2table(mean(valsMatrix, 2));
    mktFactor.Properties.RowNames = cellstr(dates);
end

