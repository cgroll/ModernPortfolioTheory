%% load data
loadData

%% create Portfolio weights (random)
portfolioWeightsTable = randPortfolioWeights(discRet);

%% calculate portfolio returns
portfolioReturns = CalcPR(discRet,portfolioWeightsTable);

%% plot portfolio returns
plotCumulatedReturn(portfolioReturns)

%% analyse portfolio returns
analysePortfolioReturns(portfolioReturns, 0.95)

%% compute Sharpe Ratio
sharpeRatio(portfolioReturns, intRates(:,1)) % with tables
sharpeRatio(portfolioReturns{:,:}, intRates{:,1}) % with matrix/vector
sharpe(portfolioReturns{:,:}, intRates{:,1}) % same result as my function
