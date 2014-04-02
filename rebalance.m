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
weights2 = zeros(size(returns,1), size(returns,2));
%weights after last day's returns
rebalanceAmount = zeros(size(returns,1),1);
% sum of rebalancing that has to be done

% assuming daily rebalancing
for ii = 1:size(returns, 1)
    weights2(ii,:) = weights(ii,:).*(1+returns(ii,:))/(1+portReturns(ii));
    rebalanceAmount(ii) = sum(abs(weights2(ii)-weights(ii)));
end

% create return struct
structValues = struct('newWeights', weights2, 'rebalanceAmount'...
    ,rebalanceAmount, 'portReturns', portReturns);
end