ReturnsTable = discRet(:,(1:100));

k = 500;

[returns, stockNames, dates] = splitTable(ReturnsTable);
numberOfStocks = length(stockNames);
numberOfDays = length(dates)-k;
weightsEffPor = zeros (numberOfDays, numberOfStocks);
weightsMinVar = zeros (numberOfDays, numberOfStocks);

for i = 1:numberOfDays
    
    covMatrix = cov(returns(1+i:i+k,:));
    mus = mean(returns(1+i:i+k,:));
    weightsMinVar(i,:) = minimumVarianceAnalyt(covMatrix);
    weightsEffPor(i,:) = EfficientPortfolio(covMatrix,mus,2 * weightsMinVar(i,:) * transpose(mus) );
end

weightsMinVarTable = combineTable(weightsMinVar,stockNames,dates(k+1:numberOfDays+k));
minVarReturns = CalcPR(ReturnsTable(k+1:numberOfDays+k,:),weightsMinVarTable);

weightsEffPorTable = combineTable(weightsEffPor,stockNames,dates(k+1:numberOfDays+k));
effPorReturns = CalcPR(ReturnsTable(k+1:numberOfDays+k,:),weightsEffPorTable);

weightsRandom = randWeights(numberOfDays,100);
weightsRandomTable = combineTable(weightsRandom,stockNames,dates(k+1:numberOfDays+k));
randomReturns = CalcPR(ReturnsTable(k+1:numberOfDays+k,:),weightsRandomTable);

weightsEqualTable = createPortfolioWeights(ReturnsTable(k+1:numberOfDays+k,:), 'equal');
equalReturns = CalcPR(ReturnsTable(k+1:numberOfDays+k,:),weightsEqualTable);

portfolioReturns = table(effPorReturns{:,:},minVarReturns{:,:},randomReturns{:,:},equalReturns{:,:});
portfolioReturns.Properties.RowNames = dates((k+1:numberOfDays+k));
portfolioReturns.Properties.VariableNames = {'EfficientPortfolio','MinimumVariancePortfolio','Random','Equal'};
plotCumulatedReturn(portfolioReturns)
sharpeRatio(effPorReturns,intRates((k+1:numberOfDays+k),1))
sharpeRatio(minVarReturns,intRates((k+1:numberOfDays+k),1))