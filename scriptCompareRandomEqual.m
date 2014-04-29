% interpretation randomly drawn random weights.
% it therefore might not be valid for another run.
% loadData()
getData()

%% create random weight matrix
%randomWeights = createPortfolioWeights(discRet, 'random');
%all(abs(sum(randomWeights{:,:},2)-1)<0.0001) % seems to work
%% create equal weight matrix
%equalWeights = createPortfolioWeights(discRet, 'equal');
%all(abs(sum(equalWeights{:,:},2)-1)<0.0001) % seems to work
%% calculate portfolio returns
portfolioRandom = CalcPR(discRet, randomWeights);
portfolioEqual = CalcPR(discRet, equalWeights);

%% diversification measures
divRand = diversification(randomWeights);
divEqu = diversification(equalWeights);

varfun(@(x)mean(x), divRand)% mean measure values for whole period
varfun(@(x)std(x), divRand) % measure value standard deviation for whole period
divEqu(1,:) % values for equal weights (for whole period the same)
% naturally for random portfolio weights not as balanced

%% calculate maximum drawdown log
maxLR = maxDrawdown(portfolioRandom)
%maxLR = maxDrawdownWiki(portfolioRandom)% function no longer existing
maxLE = maxDrawdown(portfolioEqual)  
% a little less log drawdown for equal weights
plotMaxDrawdown(maxLR, portfolioRandom);
hold on;
plotMaxDrawdown(maxLE, portfolioEqual);
hold off;
% hardly any difference between both portfolios

%% function argument no longer existing:
%% calculate maximum drawdown not log
%maxR = maxDrawdown(portfolioRandom)
%maxE = maxDrawdown(portfolioEqual)  
%absolute and standardized drawdown a little less for equally weighted
%portfolio
%plotMaxDrawdown(maxR, portfolioRandom);
%hold on;
%plotMaxDrawdown(maxE, portfolioEqual);
%hold off;
% also hardly any difference between both portfolios

%% Sharpe Ratio (libor interest rates)
sharpeRatio(portfolioRandom,intRates(:,1))
sharpeRatio(portfolioEqual,intRates(:,1))
% Sharpe Ratio a little higher for equally weighted portfolio

%% other measures for portfolio returns
analysePortfolioReturns(portfolioRandom, 0.95)
analysePortfolioReturns(portfolioEqual, 0.95)
% mean return a little higher for equal weighted portfolio, 
% but 0.95-VaR lower.
% volatility equal for both portfolios.

%% Markovitz
compareMarkowitz(discRet, portfolioEqual)
compareMarkowitz(discRet, portfolioRandom)
% no visible difference
%% compare time series
comparePlot(discRet, portfolioEqual)
comparePlot(discRet, portfolioRandom)
% also no visible difference