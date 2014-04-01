function[portfolioWeightsTable] = randPortfolioWeights(discRet)
% creates random portfolio weights for a given return table
% three periods with different weights each

sizeRet=size(discRet);

% divide time series into 3 roughly equal parts
scope1=round(sizeRet(1)/3);
scope2=sizeRet(1)-2*scope1;

% create weights
randWeights = rand(3,sizeRet(2));
randWeightsSums = sum(randWeights,2);
randWeightsSumsMatrix = randWeightsSums*ones(1,sizeRet(2));

portfolioWeightsUnique = randWeights./randWeightsSumsMatrix;
portfolioWeights = [repmat(portfolioWeightsUnique(1,:),scope1,1);...
    repmat(portfolioWeightsUnique(2,:),scope1,1);...
    repmat(portfolioWeightsUnique(3,:),scope2,1)];

% create table
portfolioWeightsTable = array2table(portfolioWeights);
portfolioWeightsTable.Properties.RowNames = discRet.Properties.RowNames;
portfolioWeightsTable.Properties.VariableNames = discRet.Properties.VariableNames;
end