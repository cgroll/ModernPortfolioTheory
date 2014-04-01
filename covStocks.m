function Cov = covStocks(mktFactor, valMatrix)
%covStocks calculates covariance matrix for given factor and returns
%
% Inputs:
%   mktFactor       nx1 table containing market factor
%   valMatrix       nxd table containing return data
%
% Outputs:
%   Cov             dxd table containing estimated covariances

    covFactor = sqrt(cov(mktFactor{:, :}));
    d = size(valMatrix, 2);

    % preallocate result matrix
    estLM= zeros(d,1);
    seEpsLM = zeros(d,1);
    for ii = 1:d
        lm = fitlm(table2array(mktFactor),valMatrix(:, ii),'linear');
        estLM(ii, 1) = lm1.Coefficients.Estimate(2);
        seEpsLM(ii, 1) = lm1.Coefficients.RMSE;
    end

    Cov = zeros(d, d);
    Cov = estLM * covFactor * estLM';
    
    % Here are some errors, will be corrected next week
    diag(Cov) = diag(Cov) + seEpsLM;
       
end



