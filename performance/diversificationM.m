function [structValues] = diversificationM(weights)
% calculates several diversification measures
%
% input: weights vector/matrix/table
% output: number of assets, number of significant assets, maximum weight,
%         standard deviation of weights, number of negative weights and
%         gini coefficient (herfindahl) as struct

% convert to matrix if table
if istable(weights)
    weights = weights{:,:};
end

% calculate measures
numberAssets = sum(weights~=0, 2);
numberSignificantAssets = sum(abs(weights-0)>0.0001,2);
maxWeight = max(abs(weights)')'; % maximum absolute value of weights
stdWeights = std(weights,0,2); % second argument is default normalization
% (by N-1 instead of N)
numberShort = sum(weights<0,2);
gini = sum(weights.^2,2);
% Herfindahl index as special case of gini coefficient because of the 
% limited number of assets (but does not distinguish between sign (positive
% or negative values)

% create return struct
structValues = struct('numberAssets', numberAssets, 'numberSignificantAssets'...
    ,numberSignificantAssets, 'maxWeight', maxWeight, 'stdWeights',stdWeights,...
    'numberShort', numberShort, 'gini',gini);
end