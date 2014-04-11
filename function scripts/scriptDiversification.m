%% with matrix
divMTest = diversification([0 0 1 2; 1 -1 5 4; -3 4 16 0.00001])
divMTest.numberAssets
divMTest.numberSignificantAssets
divMTest.maxWeight
divMTest.stdWeights
divMTest.numberShort
divMTest.gini

%% with vector
divMTest = diversification([0 2 -1 0.00001])
divMTest.numberAssets
divMTest.numberSignificantAssets
divMTest.maxWeight
divMTest.stdWeights
divMTest.numberShort
divMTest.gini

%% with table
% create Portfolio weights (random)
%loadData
portfolioWeightsTable = randPortfolioWeights(discRet);
divMTable = diversification(portfolioWeightsTable);