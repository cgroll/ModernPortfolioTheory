function [structValues] = diversification(weights)
% calculates several diversification measures
%
% input: weights vector, matrix or table, every row corresponds to the 
%        weights of one portfolio at a given time
% output: number of assets, number of significant assets, maximum weight,
%         standard deviation of weights, number of negative weights and
%         gini coefficient (herfindahl)

itsATable=0;
if istable(weights)
    itsATable=1;
    rownames=weights.Properties.RowNames;
    weights = weights{:,:};
end

numberAssets = sum(weights~=0,2);
numberSignificantAssets = sum(abs(weights-0)>0.0001,2);
maxWeight = max(weights,[],2);
stdWeights = std(weights,[],2);
numberShort = sum(weights<0,2);

% gini coefficient for negative weights
absweights = abs(weights);
sums = sum(absweights,2);
repsums = repmat(sums,1,size(weights,2));
absweights = absweights./repsums;
gini = sum(absweights.^2,2);
% Herfindahl index as special case of gini coefficient because of the 
% limited number of assets 

if itsATable==1
    numberAssets = table(numberAssets, 'RowNames', rownames);
    numberSignificantAssets = table(numberSignificantAssets, 'RowNames', rownames);
    maxWeight = table(maxWeight, 'RowNames', rownames);
    stdWeights = table(stdWeights, 'RowNames', rownames);
    numberShort = table(numberShort, 'RowNames', rownames);
    gini = table (gini, 'RowNames', rownames);
end

structValues = struct('numberAssets', numberAssets, 'numberSignificantAssets'...
    ,numberSignificantAssets, 'maxWeight', maxWeight, 'stdWeights',stdWeights,...
    'numberShort', numberShort, 'gini',gini);
end