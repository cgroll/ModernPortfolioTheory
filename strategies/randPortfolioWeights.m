function [portfolioWeightsTable] = randPortfolioWeights(discRet)
%randPortfolioWeights generate random weights for return table
%
% Inputs:
%   discRet     mxn table of return data
%
% Outputs:
%   portfolioWeightsTable   mxn table consisting of three different
%                           random portfolio weights that are held
%                           approximately a third of the time each

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