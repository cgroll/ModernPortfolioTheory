function [ wgts ] = maximumSharpeRatio( covMatr, mus, interestRate)
% caluculates weights for Portfolio, that maximizes Sharpe Ratio
%   Detailed explanation goes here

%Minimizing negativ Sharpe Ratio => maximizing Sharpe Ratio
optimalMu =  fminsearch(@calobj,mean(mus));

%calculating weights for maximal Sharpe Ratio
wgts = EfficientPortfolio(covMatr,mus,optimalMu);

    %Function that returns negativ Sharpe Ratio
    function sharpeRatio = calobj(targetReturn)
        
        wgts=EfficientPortfolio(covMatr,mus,targetReturn);
        portfolioMu = mus*wgts';
        portfolioVariance = wgts * covMatr * wgts';
        sharpeRatio = -(portfolioMu - interestRate)/portfolioVariance;
        
    end
    
    

end

