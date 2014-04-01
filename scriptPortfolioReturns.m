%% load data
loadData

%% create Portfolio weights (random)
randWeights = rand(3,348);
randWeightsSums = sum(randWeights,2);
randWeightsSumsMatrix = randWeightsSums*ones(1,348);

portfolioWeightsUnique = randWeights./randWeightsSumsMatrix;
portfolioWeights = [repmat(portfolioWeightsUnique(1,:),1000,1);...
    repmat(portfolioWeightsUnique(2,:),3000,1);...
    repmat(portfolioWeightsUnique(3,:),607,1)];
portfolioWeightsTable = array2table(portfolioWeights);
portfolioWeightsTable.Properties.RowNames = discRet.Properties.RowNames;
portfolioWeightsTable.Properties.VariableNames = discRet.Properties.VariableNames;
%% calculate portfolio returns
portfolioReturns = CalcPR(discRet,portfolioWeightsTable);
%% analyse portfolio returns
analysePortfolioReturns(portfolioReturns, 0.95)