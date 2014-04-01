function [structValues] = analysePortfolioReturns(returns, varP)
% calculate portfolio indicators: mean, volatility, VaR
% 
% Inputs:
%   returns     nx1 table of returns
%   varP        significance level of value-at-risk (e.g. 0.95)
%
% Outputs:
%   structValues    performance indicators as structure with fields mean,
%                   volatility and VaR

% convert table to vector if necessary
if istable(returns)
returns=returns{:,:};
end


meanReturn = mean(returns);
volatility = std(returns);
VaR = quantile(returns, 1-varP);


structValues = struct('mean', meanReturn, ...
    'volatility', volatility, 'VaR', VaR);

end