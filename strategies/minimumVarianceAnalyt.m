function wgts = minimumVarianceAnalyt(covMatr)
% analytical solution for global minimum variance portfolio
%
% Inputs:
%   covMatr     nAss x nAss matrix of asset covariances
%
% Outputs:
%   wgts        1 x nAss matrix of asset weights
%   

nAss = length(covMatr(1,:));
weights = covMatr\ones(nAss, 1) / (ones(1, nAss)/covMatr*ones(nAss, 1));
wgts = transpose(weights);

end