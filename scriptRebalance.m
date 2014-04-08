%% load data
loadData

%% create Portfolio weights (random)
portfolioWeightsTable = randPortfolioWeights(discRet);

%% calculate portfolio returns
portfolioReturns = CalcPR(discRet,portfolioWeightsTable);

%% test rebalance function
rebalanceStruct = rebalance(discRet, portfolioWeightsTable);