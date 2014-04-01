function[sharpeRatio] = sharpeRatio(returns, interest)
% calculates sharpe ratio
% Inputs: 
%   returns     nx1 table or vector of portfolio returns
%   interest    nx1 table or vector of interest rates (on a daily basis)
%
% Outputs:
%   sharpeRatio     as scalar value 

% extract matrix if table
if istable(returns)
    returns=returns{:,:};
end
if istable(interest)
    interest=interest{:,:};
end

meanReturn = mean(returns);
volatility = std(returns);
meanInterest = mean(interest);

sharpeRatio = (meanReturn-meanInterest)/volatility;

end