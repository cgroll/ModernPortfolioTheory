function[structValues] = analysePortfolioReturns(returns, varP)
% calculates mean, volatility and empirical value at risk
% input: returns as vector, varP as double in the interval [0,1]
% output: struct with mean, volatility and VaR

returns=returns{:,:};
meanReturn = mean(returns);
volatility = std(returns);
VaR = quantile(returns, 1-varP);
%sharpe = 
structValues=struct('mean', meanReturn, 'volatility', volatility, 'VaR', VaR);
end