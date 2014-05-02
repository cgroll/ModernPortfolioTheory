%% load data
loadData

%% create Portfolio weights (random)
portfolioWeightsTable = randPortfolioWeights(discRet);

%% calculate portfolio returns
portfolioReturns = CalcPR(discRet,portfolioWeightsTable);

%% test rebalance function
rebalanceStruct = rebalance(discRet, portfolioWeightsTable);
%sum(rebalanceStruct.rebalance,2)

% % test with matrices (not working)
% rebalanceStruct = rebalance(discRet{:,:}, portfolioWeightsTable{:,:});
% drM=discRet{:,:};
% pwM=portfolioWeightsTable{:,:};