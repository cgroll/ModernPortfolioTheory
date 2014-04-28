function [randWgts] = randWeights(nObs, nAss)
%randWeights generate random weights for given dimensions
%
% Inputs:
%   nObs        scalar, number of observations
%   nAss        scalar, number of assets
%
% Outputs:
%   randWgts    nObs x nAss matrix of portfolio weights

randVals = rand(nObs, nAss);
rowSums = sum(randVals, 2);
randWgts = randVals ./ repmat(rowSums, 1, nAss);

end