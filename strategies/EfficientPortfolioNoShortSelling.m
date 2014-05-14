function [ weights ] = EfficientPortfolioNoShortSelling( covariates, mu, targetReturn )
% calculates efficient portfolio without Short selling
%   Detailed explanation goes here

if (max(mu)<targetReturn)
error('target can''t not be reached');
end
   
restrictionsLeftHand = [ones(1,length(mu));mu];
restrictionsRightHand = [1,targetReturn];
options = optimset('Algorithm','active-set','Display','off');
weights = quadprog(covariates,[],[],[],restrictionsLeftHand,restrictionsRightHand,zeros(length(mu),1),ones(length(mu),1),[], options);

end