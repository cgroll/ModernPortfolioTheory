function wgts = EfficientPortfolio(covMatr, mus, targetReturn )
% calculates efficient portfolio for given target expected return
%
% Inputs:
%   covMatr         nAss x nAss matrix of asset covariances
%   mus             1 x nAss matrix of mean asset returns
%   targetReturn    scalar value: target expected return
%
% Outputs:
%
% calculates efficient portfolio for given covariance matrix, expected
% returns and targetReturn, see
% http://hkumath.hku.hk/~imr/records0708/LaiLec1.pdf, p.4

nAss = length(mus);

% calculate auxiliary variables
a = mus/covMatr * ones(nAss,1);
b = mus/covMatr * transpose(mus);
c = ones(1,nAss)/covMatr * ones(nAss,1);
d = b*c-a^2;

g = b*(covMatr\ones(nAss,1)) - a*(covMatr\transpose(mus));
h = targetReturn * (c * (covMatr\transpose(mus)) - a * (covMatr\ones(nAss,1)));
weights = (g + h)/d;

wgts = transpose(weights);
end

