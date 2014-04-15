%% load data
loadData

%% create Portfolio weights (random)
portfolioWeightsTable = randPortfolioWeights(discRet);

%% calculate portfolio returns
portfolioReturns = CalcPR(discRet,portfolioWeightsTable);

%% compare Returns
comparePlot(discRet, portfolioReturns);
%% Markowitz
compareMarkowitz(discRet, portfolioReturns);
% mu of portfolio to big to make sense