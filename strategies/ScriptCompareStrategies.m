numberOfAssets = 30;
ReturnsTable = discRet(:,(1:numberOfAssets));

k = 500;

[returns, stockNames, dates] = splitTable(ReturnsTable);
numberOfStocks = length(stockNames);
numberOfDays = length(dates)-k;
weightsEffPor = zeros (numberOfDays, numberOfStocks);
weightsMinVar = zeros (numberOfDays, numberOfStocks);

for i = 1:numberOfDays
    
    covMatrix = cov(returns(i:i+k-1,:));
    mus = mean(returns(i:i+k-1,:));
    weightsMinVar(i,:) = minimumVarianceAnalyt(covMatrix);
    targetReturn = 1.5 * weightsMinVar(i,:) * transpose(mus);
    weightsEffPor(i,:) = EfficientPortfolio(covMatrix,mus,targetReturn);
end

weightsMinVarTable = combineTable(weightsMinVar,stockNames,dates(k+1:numberOfDays+k));
minVarReturns = CalcPR(ReturnsTable(k+1:numberOfDays+k,:),weightsMinVarTable);

weightsEffPorTable = combineTable(weightsEffPor,stockNames,dates(k+1:numberOfDays+k));
effPorReturns = CalcPR(ReturnsTable(k+1:numberOfDays+k,:),weightsEffPorTable);

weightsRandomTable = createPortfolioWeights(ReturnsTable(k+1:numberOfDays+k,:), 'random');
randomReturns = CalcPR(ReturnsTable(k+1:numberOfDays+k,:),weightsRandomTable);

weightsEqualTable = createPortfolioWeights(ReturnsTable(k+1:numberOfDays+k,:), 'equal');
equalReturns = CalcPR(ReturnsTable(k+1:numberOfDays+k,:),weightsEqualTable);

portfolioReturns = table(effPorReturns{:,:},minVarReturns{:,:},randomReturns{:,:},equalReturns{:,:});
portfolioReturns.Properties.RowNames = dates((k+1:numberOfDays+k));
portfolioReturns.Properties.VariableNames = {'EfficientPortfolio','MinimumVariancePortfolio','Random','Equal'};

plotCumulatedReturn(portfolioReturns)
sharpeRatio(effPorReturns,intRates((k+1:numberOfDays+k),1))
sharpeRatio(minVarReturns,intRates((k+1:numberOfDays+k),1))
sharpeRatio(randomReturns,intRates((k+1:numberOfDays+k),1))
sharpeRatio(equalReturns,intRates((k+1:numberOfDays+k),1))