function [wgts, varPor] = minimumVariance(covMatr)
% calculates weights for global minimum variance portfolio
%
% Inputs:
%   covMatr     nAss x nAss matrix of asset covariances
%
% Outputs:
%   wgts        1 x nAss matrix of asset weights
%   varPor      scalar value: portfolio variance
%

nAss = length(covMatr(1,:));
weights = quadprog(covMatr, [],[],[], ones(1,nAss),1);
wgts = transpose(weights);
varPor = transpose(weights) * covMatr * weights;

end

