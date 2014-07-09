numberOfAssets = 50;
ReturnsTable = discRet(:,(1:numberOfAssets));

k = 500;

[returns, stockNames, dates] = splitTable(ReturnsTable);
numberOfStocks = length(stockNames);
numberOfDays = length(dates)-k;
weightsEffPor = zeros (numberOfDays, numberOfStocks);
weightsEffPorMaxWgts = zeros (numberOfDays, numberOfStocks);
weightsMinVar = zeros (numberOfDays, numberOfStocks);

for i = 1:numberOfDays
    
    covMatrix = cov(returns(i:i+k-1,:));
    mus = mean(returns(i:i+k-1,:));
    weightsMinVar(i,:) = minimumVarianceAnalyt(covMatrix);
    targetReturn = 1.5 * weightsMinVar(i,:) * transpose(mus);
    weightsEffPorMaxWgts(i,:) = EfficientPortfolioMaxWgts(covMatrix,mus,targetReturn,0.15);
    weightsEffPor(i,:) = EfficientPortfolio(covMatrix,mus,targetReturn);
end

weightsMinVarTable = combineTable(weightsMinVar,stockNames,dates(k+1:numberOfDays+k));
minVarReturns = CalcPR(ReturnsTable(k+1:numberOfDays+k,:),weightsMinVarTable);

weightsEffPorTable = combineTable(weightsEffPor,stockNames,dates(k+1:numberOfDays+k));
effPorReturns = CalcPR(ReturnsTable(k+1:numberOfDays+k,:),weightsEffPorTable);

weightsEffPorMaxWgtsTable = combineTable(weightsEffPorMaxWgts,stockNames,dates(k+1:numberOfDays+k));
effPorMaxWgtsReturns = CalcPR(ReturnsTable(k+1:numberOfDays+k,:),weightsEffPorMaxWgtsTable);

weightsRandomTable = createPortfolioWeights(ReturnsTable(k+1:numberOfDays+k,:), 'random');
randomReturns = CalcPR(ReturnsTable(k+1:numberOfDays+k,:),weightsRandomTable);

weightsEqualTable = createPortfolioWeights(ReturnsTable(k+1:numberOfDays+k,:), 'equal');
equalReturns = CalcPR(ReturnsTable(k+1:numberOfDays+k,:),weightsEqualTable);

portfolioReturns = table(effPorReturns{:,:},effPorMaxWgtsReturns{:,:},minVarReturns{:,:},randomReturns{:,:},equalReturns{:,:});
portfolioReturns.Properties.RowNames = dates((k+1:numberOfDays+k));
portfolioReturns.Properties.VariableNames = {'EfficientPortfolio','EfficientPortfolioMaxWeights','MinimumVariancePortfolio','Random','Equal'};

plotCumulatedReturn(portfolioReturns)
sharpeRatioArray = zeros(1,5);
sharpeRatioArray(1) = sharpeRatio(effPorReturns,intRates((k+1:numberOfDays+k),1));
sharpeRatioArray(2) = sharpeRatio(effPorMaxWgtsReturns,intRates((k+1:numberOfDays+k),1));
sharpeRatioArray(3) = sharpeRatio(minVarReturns,intRates((k+1:numberOfDays+k),1));
sharpeRatioArray(4) = sharpeRatio(randomReturns,intRates((k+1:numberOfDays+k),1));
sharpeRatioArray(5) = sharpeRatio(equalReturns,intRates((k+1:numberOfDays+k),1));
sharpeRatioArray