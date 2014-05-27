function [ wgts, varPor, muPor ] = EfficientPortfolioNoShortSelling(covMatr, mus, targetReturn )
% calculates efficient portfolio without short selling
%
% Inputs: 
%   covMatr         nAss x nAss matrix of asset covariances
%   mus             1 x nAss matrix of mean asset returns
%   targetReturn    scalar value: target expected return
%
% Outputs:
%   wgts            1 x nAss matrix of asset weights
%   varPor          scalar value: portfolio variance
%   muPor           scalar value: expected portfolio return

nAss = length(mus);

if (max(mus)< targetReturn || min(mus) > targetReturn)
    error('target can''t not be reached');
end

% set up equality restrictions
eqRestrictionsLeftHand = [ones(1, nAss); mus];
eqRestrictionsRightHand = [1, targetReturn];

% set up inequality restrictions
lb = zeros(nAss, 1);
ub = ones(nAss,1);

options = optimset('Algorithm','active-set','Display','off');
weights = quadprog(covMatr,[],[],[],...
    eqRestrictionsLeftHand, eqRestrictionsRightHand,...
    lb, ub, ...
    [], options);

wgts = transpose (weights);
varPor = transpose(weights) * covMatr * weights;
muPor = mus * weights;

end