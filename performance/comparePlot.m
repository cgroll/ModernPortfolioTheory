function [] = comparePlot(assetRet, portRet)
% visualize time series for all single assets and portfolio

pricesAssets = cumprod(assetRet{:,:}+1,1);
pricesPortfolio = cumprod(portRet{:,:}+1);

dateVector = datenum(assetRet.Properties.RowNames);

figure
plot(dateVector, pricesAssets, 'color', 0.7*[1 1 1]);
hold on;
plot(dateVector, pricesPortfolio, 'color', 'red', 'LineWidth',3);

datetick 'x';


xlabel 'time';
ylabel 'price';
title 'Comparison Portfolio (red) and Asset Returns';
shg

end