function [ weights ] = minimumVarianceNoShortSelling( covariates )
%calculates weights for minimum variance portfolio without short selling
%   Detailed explanation goes here
n = length(covariates(1,:));
options = optimset('Algorithm','active-set','Display','off');
weights = quadprog(covariates, [],[],[], ones(1,n),1,zeros(n,1),ones(n,1),[],options);

end

