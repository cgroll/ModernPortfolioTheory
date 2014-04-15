function [divIndicators] = diversification(weights)
% calculates several diversification measures
%
% input:    
%   weights     weights vector, matrix or table - weights in rows
%
% output: 
%   divIndicators   table containing information on number of assets, 
%                   number of significant assets, maximum weight,
%                   standard deviation of weights, number of negative 
%                   weights and gini coefficient (herfindahl) for each day

% specify tolerance level for significant weights
sigLev = 0.0001;

checkWeights(weights)

% transpose if column vector
if ~istable(weights)
    if size(weights, 2) == 1
        % if column vector, transpose
        weights = weights';
    end
end

% extract rownames from table
if istable(weights)
    rownames = weights.Properties.RowNames;
    weights = weights{:,:};
else
    rownames = {};
end


% get diversification indicators for each row
numberAssets = sum(weights~=0,2);
numberSignificantAssets = sum(abs(weights-0) > sigLev,2);
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

divIndicators = table(numberAssets, ...
    numberSignificantAssets, ...
    maxWeight, ...
    stdWeights, ...
    numberShort, ...
    gini, ...
    'VariableNames', ...
    {'nAss', 'nSignificantAss', 'maxWeight', 'std', 'nShort', 'gini'});

divIndicators.Properties.RowNames = rownames;

end