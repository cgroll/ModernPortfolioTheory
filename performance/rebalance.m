function [structValues] = rebalance(returns, weights)
% re-balance and transaction costs
%
% input: returns, weights table
% output: new weights, amount of rebalancing necessary, portfolio returns

%% begin not work
% convert to table if matrix (for CalcPR to work)
% not sure, however, if we should go through all this to make this function
% applicable to matrices
% if ~istable(returns)
%     returns=array2table(returns);
% end
% if ~istable(weights)
%     weights=array2table(weights);
% end
% not working anyway, because CalcPR needs stock names!!!
%% end not work

portReturns = CalcPR(returns,weights);

portReturns = portReturns{:,:};

% convert to matrix if table
if istable(weights)
    weights = weights{:,:};
end

if istable(returns)
    returns = returns{:,:};
end

%preallocation
weightsDueToPriceChanges = zeros(size(returns));
dailyRebalancing = zeros(size(returns,1), size(returns,2));
%dailyOverallRebalancing = zeros(size(returns,1),1);

% sum of rebalancing that has to be done

% assuming daily rebalancing
for ii = 1:size(returns, 1)
    weightsDueToPriceChanges(ii,:) = ...
        weights(ii,:).*(1+returns(ii,:))/(1+portReturns(ii));
%     dailyRebalancing(ii,:) = ...
%         weightsDueToPriceChanges(ii,:) - weights(ii,:);
    
end

%     weightsDueToPriceChanges = ...
%         weights.*(1+returns)/(1+portReturns);
    dailyRebalancing = ...
        weightsDueToPriceChanges - weights;
dailyOverallRebalancing = ...
        sum(abs(dailyRebalancing),2);

% create return struct
structValues = struct('newWeights', weightsDueToPriceChanges, ...
    'rebalance', dailyRebalancing, 'rebalanceAmount'...
    ,dailyOverallRebalancing, 'portReturns', portReturns);
end