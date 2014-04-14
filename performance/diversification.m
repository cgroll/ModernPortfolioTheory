function [structValues] = diversification(weights)
% calculates several diversification measures
%
% input: weights vector
% output: number of assets, number of significant assets, maximum weight,
%         standard deviation of weights, number of negative weights and
%         gini coefficient (herfindahl)


if istable(weights)
    weights = weights{:,:};
end

numberAssets = sum(weights~=0);
numberSignificantAssets = sum(abs(weights-0)>0.0001);
maxWeight = max(weights);
stdWeights = std(weights);
numberShort = sum(weights<0);

% gini coefficient for negative weights
absweights = abs(weights);
absweights = absweights./repmat(sum(absweights,2),1,size(weights,2));
gini = sum(absweights.^2);
% Herfindahl index as special case of gini coefficient because of the 
% limited number of assets 



structValues = struct('numberAssets', numberAssets, 'numberSignificantAssets'...
    ,numberSignificantAssets, 'maxWeight', maxWeight, 'stdWeights',stdWeights,...
    'numberShort', numberShort, 'gini',gini);
end