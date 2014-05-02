function [structValues] = rebalance(returns, weights)
% re-balance and transaction costs (in the form of total rebalance amount
% per day and altogether
%
% input: returns, weights table
% output: new weights, amount of rebalancing necessary, portfolio returns




portReturns = CalcPR(returns,weights);

portReturns = portReturns{:,:};

% convert to matrix if table
if istable(weights)
    weights = weights{:,:};
end

if istable(returns)
    returns = returns{:,:};
end


%  daily rebalancing
weightsDueToPriceChanges = ...
    weights.*(1+returns)./repmat((1+portReturns),1,size(returns,2));
dailyRebalancing = ...
    weightsDueToPriceChanges - weights;
dailyOverallRebalancing = ...
    sum(abs(dailyRebalancing),2);

% return struct
structValues = struct('newWeights', weightsDueToPriceChanges, ...
    'rebalance', dailyRebalancing, 'rebalanceAmount'...
    ,dailyOverallRebalancing, 'rebalanceAltogether', ...
    sum(dailyOverallRebalancing), 'portReturns', portReturns);
end