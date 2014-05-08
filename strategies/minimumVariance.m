function [ weights ] = minimumVariance( covariates )
%calculates weights for minimum variance portfolio
%   Detailed explanation goes here
n = length(covariates(1,:));
weights = quadprog(covariates, [],[],[], ones(1,n),1);

end

