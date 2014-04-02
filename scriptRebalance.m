%% load data
loadData

%% create Portfolio weights (random)
portfolioWeightsTable=randPortfolioWeights(discRet);

% randWeights = rand(3,348);
% randWeightsSums = sum(randWeights,2);
% randWeightsSumsMatrix = randWeightsSums*ones(1,348);
% 
% portfolioWeightsUnique = randWeights./randWeightsSumsMatrix;

%% calculate portfolio returns
%portfolioReturns = CalcPR(discRet,portfolioWeightsTable);

%% test rebalance function
rebalanceStruct = rebalance(discRet, portfolioWeightsTable);