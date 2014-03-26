function newTable = embed(vals,data)
% embed matrix in given table 
% Inputs:
%   vals        mxn matrix of stock returns
%   data        table
%
% Outputs:
%   newTable table that combines all three components

newTable = array2table(vals);
newTable.Properties.VariableNames = data.Properties.VariableNames;
newTable.Properties.RowNames = data.Properties.RowNames;



end
