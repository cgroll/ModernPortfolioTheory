discRet = loadRets();
intRates = readInterestDailised();
% create random weight matrix:
randomWeights = createPortfolioWeights(discRet, 'random');
% create equal weight matrix:
equalWeights = createPortfolioWeights(discRet, 'equal');