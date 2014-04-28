function [structValues] = rebalance(returns, weights)
% re-balance and transaction costs
%
% input: returns, weights table
% output: new weights, amount of rebalancing necessary, portfolio returns

% convert to matrix if table
portReturns = CalcPR(returns,weights);
portReturns = portReturns{:,:};

if istable(weights)
    weights = weights{:,:};
end

if istable(returns)
    returns = returns{:,:};
end

%preallocation
weightsDueToPriceChanges = zeros(size(returns));
dailyOVerallRebalancing = zeros(size(returns,1),1);

% sum of rebalancing that has to be done

% assuming daily rebalancing
for ii = 1:size(returns, 1)
    weightsDueToPriceChanges(ii,:) = ...
        weights(ii,:).*(1+returns(ii,:))/(1+portReturns(ii));
    dailyOVerallRebalancing(ii) = ...
        sum(abs(weightsDueToPriceChanges(ii) - weights(ii)));
end

% either daily rebalancing or not!!!
% not assuming daily rebalancing
portReturns = zeros(size(returns,1),1);
portReturns(1) = CalcPR(returns(1,:), weights(1,:));
for ii = 1:size(returns,1)
    weightsDueToPriceChanges(ii,:) = weights(ii,:).*(1+returns(ii,:))/(1+portReturns(ii));
    if ii<size(returns,1)
        portReturns(ii+1) = CalcPR(returns(ii,:),weightsDueToPriceChanges(ii,:));
    end
    % add something like if some event then rebalance
end

% create return struct
structValues = struct('newWeights', weightsDueToPriceChanges, 'rebalanceAmount'...
    ,dailyOVerallRebalancing, 'portReturns', portReturns);
end