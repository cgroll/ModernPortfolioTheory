function [ wgts, varPor, muPor] = EfficientPortfolioMaxWgts(covMatr, mus, targetReturn, maxWgts)
% calculates efficient portfolio without short selling
%
% Inputs: 
%   covMatr         nAss x nAss matrix of asset covariances
%   mus             1 x nAss matrix of mean asset returns
%   targetReturn    scalar value: target expected return
%   maxWgts         scalar value: maximal weight of asset
%
% Outputs:
%   wgts            1 x nAss matrix of asset weights
%   varPor          scalar value: portfolio variance
%   muPor           scalar value: expected portfolio return

nAss = length(mus);
%{
sortedMus = sort(mus);
maxReturn = 0;
minReturn = 0;
for i=1:(floor(1/maxWgts))
    maxReturn = maxReturn + maxWgts * sortedMu(nAss+1-i);
    minReturn = minReturn - maxWgts * sortedMu(nAss+1-i);
end

if (max(mus)< targetReturn || min(mus) > targetReturn)
    error('target can''t not be reached');
end
%}

% set up equality restrictions
eqRestrictionsLeftHand = [ones(1, nAss); mus];
eqRestrictionsRightHand = [1, targetReturn];

% set up inequality restrictions
ub = ones(nAss,1) * maxWgts;
lb = - ub;

options = optimset('Algorithm','active-set','Display','off');
[weights,fval,exitflag] = quadprog(covMatr,[],[],[],...
    eqRestrictionsLeftHand, eqRestrictionsRightHand,...
    lb, ub, ...
    [], options);

if(exitflag == -2)
    error('target can''t not be reached');
end

wgts = transpose (weights);
varPor = transpose(weights) * covMatr * weights;
muPor = mus * weights;

end

