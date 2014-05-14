function [ weights ] = maximumSharpeRatio( covariates, mu, interestRate)
% caluculates weights for Portfolio, that maximizes Sharpe Ratio
%   Detailed explanation goes here

%Minimizing negativ Sharpe Ratio => maximizing Sharpe Ratio
optimalMu =  fminsearch(@calobj,mean(mu));

%calculating weights for maximal Sharpe Ratio
weights = EfficientPortfolio(covariates,mu,optimalMu);

    %Function that returns negativ Sharpe Ratio
    function sharpeRatio = calobj(targetReturn)
        
        weights=EfficientPortfolio(covariates,mu,targetReturn);
        portfolioMu = mu*weights;
        portfolioVariance = transpose(weights) * covariates * weights;
        sharpeRatio = -(portfolioMu - interestRate)/portfolioVariance;
        
    end
    
    

end

