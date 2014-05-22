function [ weights ] = EfficientPortfolioNoShortSelling(covMatr, mus, targetReturn )
% calculates efficient portfolio without short selling
%
% Inputs:
%
% Outputs:
%

nAss = length(mus);

if (max(mus)<targetReturn)
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
end