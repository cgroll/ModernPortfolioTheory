function[structValues] = analysePortfolioReturns(returns, varP)
% calculates mean, volatility and empirical value at risk
% input: returns as vector (or table respectively), varP as double in the interval [0,1]
% output: struct with mean, volatility and VaR

% convert table to vector if necessary
if istable(returns)
returns=returns{:,:};
end

% calculate measures
meanReturn = mean(returns);
volatility = std(returns);
VaR = quantile(returns, 1-varP);

structValues=struct('mean', meanReturn, 'volatility', volatility, 'VaR', VaR);
end