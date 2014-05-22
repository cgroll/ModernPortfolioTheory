function wgts = maximumSharpeRatioAnalyt(covMatr, mus, intRate)
% calculate Sharpe Ratio maximizing portfolio weights
%   
% Inputs:
%   covMatr         nAss x nAss matrix of asset covariances
%   mus             1 x nAss matrix of mean asset returns
%   intRate         scalar value: prevailing annualized interest rate
%
% Outputs:
%   wgts        1 x nAss matrix of asset weights

nAss = size(covMatr, 1);
musExcess = (mus - intRate)';

weights = inv(covMatr)*musExcess / (ones(1, nAss)*inv(covMatr) * musExcess);
% weights = covMatr\(musExcess) / ((ones(nAss, 1)\covMatr) * musExcess);
% weights = (covMatr\musExcess) / (ones(nAss,1)'/covMatr * musExcess);

wgts = transpose(weights);

end