function [portfolioWeightsTable] = createPortfolioWeights(discRet, kind)
% createPortfolioWeights generates random weights (kind='random') or 
% equal weights (kind = 'equal') for any given return table
% 
%
% Inputs:
%   discRet     mxn table of return data and kind of weights to be created
%
% Outputs:
%   portfolioWeightsTable   mxn table consisting of random portfolio 
%                           weights or equal portfolio weights

sizeRet=size(discRet);

% create weights

if (strcmp(kind,'random'))
    randWeights = rand(sizeRet(1),sizeRet(2));
    randWeightsSums = sum(randWeights,2);
    randWeightsSumsMatrix = randWeightsSums*ones(1,sizeRet(2));
    portfolioWeights = randWeights./randWeightsSumsMatrix;
end
if (strcmp(kind,'equal'))
    portfolioWeights = repmat(1/sizeRet(2), sizeRet(1), sizeRet(2));
end
    


% create table
portfolioWeightsTable = array2table(portfolioWeights);
portfolioWeightsTable.Properties.RowNames = discRet.Properties.RowNames;
portfolioWeightsTable.Properties.VariableNames = discRet.Properties.VariableNames;
end