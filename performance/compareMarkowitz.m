function [] = compareMarkowitz(assetRet, portRet)


assetRet = assetRet{:,:};
portRet = portRet{:,:};

sigmaAsset = std(assetRet,[],1);
muAsset = mean(assetRet,1);

sigmaPortfolio = std(portRet);
muPortfolio = mean(portRet);


figure
plot(sigmaAsset,muAsset,'.', 'color', 0.7*[1 1 1]);
hold on;
plot(sigmaPortfolio, muPortfolio,'.', 'color', 'red', 'MarkerSize',20);


xlabel 'sigma';
ylabel 'mu';
title 'Comparison Portfolio (red) and Asset Returns';
shg

end