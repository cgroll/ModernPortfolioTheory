function Cov = covStocks(mktFactor, valMatrix)

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



