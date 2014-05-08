function [ weights ] = EfficientPortfolio( covariates, mu, targetReturn )
% calculates efficient portfolio 
% calculates efficient portfolio for given covariates, expected returns and
% targetReturn, see http://hkumath.hku.hk/~imr/records0708/LaiLec1.pdf, p.4
n = length(mu);
a = mu/covariates * ones(n,1);
b = mu/covariates * transpose(mu);
c = ones(1,n)/covariates * ones(n,1);
d = b*c-a^2;
g = b*(covariates\ones(n,1)) - a*(covariates\transpose(mu));
h = targetReturn * (c * (covariates\transpose(mu)) - a * (covariates\ones(n,1)));
weights = (g + h)/d;
end

