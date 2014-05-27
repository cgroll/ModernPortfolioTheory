function [ wgts, varPor ] = minimumVarianceNoShortSelling( covMatr )
%calculates weights for minimum variance portfolio without short selling
%   
% Inputs:
%   covMatr     nAss x nAss matrix of asset covariances
%
% Outputs:
%   wgts        1 x nAss matrix of asset weights
%   varPor      scalar value: portfolio variance
%

n = length(covMatr(1,:));
options = optimset('Algorithm','active-set','Display','off');
weights = quadprog(covMatr, [],[],[], ones(1,n),1,zeros(n,1),ones(n,1),[],options);
wgts = transpose(weights);
varPor = transpose(weights) * covMatr * weights;

end

