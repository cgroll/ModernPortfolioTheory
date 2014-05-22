% the script shall analyse Markowitz portfolio selection

loadData()

%% get empirical moments

mus = varfun(@(x)mean(x), discRet);
mus.Properties.VariableNames = discRet.Properties.VariableNames;

covMatr = array2table(cov(discRet{:,:}));
covMatr.Properties.VariableNames = discRet.Properties.VariableNames;
covMatr.Properties.RowNames = discRet.Properties.VariableNames;

%% get global minimum variance portfolio weights

wgtsNumerical = minimumVariance(covMatr{:, :});
wgtsAnalyt = minimumVarianceAnalyt(covMatr{:, :});

%% get efficient portfolio weights for given mu values
% muTargets = 

%% get Sharpe Ratio maximizing weights

intRate = varfun(@(x)mean(x), intRates(:, 1));

wgtsNumerical = maximumSharpeRatio(covMatr{:, :}, ...
    mus{:, :}, intRate{:, :});
wgtsAnalyt = maximumSharpeRatioAnalyt(covMatr{:, :}, ...
    mus{:, :}, intRate{:, :});

% get associated Sharpe Ratios
mu1 = wgtsNumerical*mus{:, :}';
sigma1 = sqrt(wgtsNumerical * covMatr{:, :} * wgtsNumerical');
SRNumerical = (mu1 - intRate{:, :})/sigma1

mu2 = wgtsAnalyt*mus{:, :}';
sigma2 = sqrt(wgtsAnalyt * covMatr{:, :} * wgtsAnalyt');
SRAnalytical = (mu2 - intRate{:, :})/sigma2


