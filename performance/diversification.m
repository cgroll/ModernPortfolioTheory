function [structValues] = diversification(weights)
% calculates several diversification measures
%
% input: weights vector
% output: number of assets, number of significant assets, maximum weight,
%         standard deviation of weights, number of negative weights and
%         gini coefficient (herfindahl)

numberAssets = sum(weights~=0);
numberSignificantAssets = sum(abs(weights-0)>0.0001);
maxWeight = max(weights);
stdWeights = std(weights);
numberShort = sum(weights<0);
gini = sum(weights.^2);
% Herfindahl index as special case of gini coefficient because of the 
% limited number of assets (but does not distinguish between sign (positive
% or negative values)


structValues = struct('numberAssets', numberAssets, 'numberSignificantAssets'...
    ,numberSignificantAssets, 'maxWeight', maxWeight, 'stdWeights',stdWeights,...
    'numberShort', numberShort, 'gini',gini);
end
