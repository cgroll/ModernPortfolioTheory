function tests = testDiversification
% unit tests for diversification indicators
tests = functiontests(localfunctions);
end

function testColumnVector(testCase)
% create single portfolio as column vector
wgts = rand(8,1);
wgts = wgts./sum(wgts);

divIndicators = diversification(wgts);
end

function testWeightsMatrix(testCase)
wgts = randWeights(10, 8);

divIndicators = diversification(wgts);
end

function testWeightsTable(testCase)
wgts = table(randWeights(10, 8));

divIndicators = diversification(wgts);
end

function testShortSelling(testCase)
% number of shorted assets must be smaller than number of assets
wgts = table(randWeights(10, 8));

divIndicators = diversification(wgts);
allDaysValid = all(divIndicators.nShort < divIndicators.nAss);

verifyTrue(testCase, allDaysValid)
end

function testShortSignificantAssets(testCase)
% number of significant assets must be smaller/equal than number of assets
wgts = table(randWeights(10, 8));

divIndicators = diversification(wgts);
allDaysValid = all(divIndicators.nSignificantAss <= divIndicators.nAss);

verifyTrue(testCase, allDaysValid)
end

function testMaxWgts(testCase)
% maximum weights must be smaller than 1 and larger than 0
wgts = table(randWeights(10, 8));

divIndicators = diversification(wgts);
allDaysValid = ...
    all(divIndicators.maxWeight <= 1 & divIndicators.maxWeight >= 0);

verifyTrue(testCase, allDaysValid)
end