function[sharpeRatio] = sharpeRatio(returns, interest)
% calculates sharpe ratio
% input: returns as vector (table), interest rates (on a daily basis) as
% vector (table)
% output: sharpe ratio

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