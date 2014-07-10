
n = 30;

mu=mean(discRet{:,1:n});
covMatrix = cov(discRet{:,1:n});nPoints = 25;
muTest = zeros(nPoints,1);
muTest(1) = minimumVarianceNoShortSelling(covMatrix) * transpose(mu);

for i = 1:nPoints
    muTest(i+1) = muTest(i) + ( max(mu) - muTest(1) ) / (nPoints+1);
end

volaNoShort = zeros (26,1);
volaShort = zeros (26,1);

for i = 1:nPoints+1
    wgts = EfficientPortfolio(covMatrix,mu,muTest(i));
    volaShort(i) = sqrt(wgts * covMatrix * transpose(wgts));
    wgts = EfficientPortfolioNoShortSelling(covMatrix,mu,muTest(i));
    volaNoShort(i) = sqrt(wgts * covMatrix * transpose(wgts));
end

plot(volaNoShort,muTest,'DisplayName','No Short Selling allowed','XDataSource','muTest','YDataSource','volaNoShort');hold all;plot(volaShort,muTest,'DisplayName','Short Selling allowed','XDataSource','muTest','YDataSource','volaShort');hold off;figure(gcf);

figure1 = plot(volaNoShort,muTest,'DisplayName','No Short Selling allowed','XDataSource','muTest','YDataSource','volaNoShort');hold all;plot(volaShort,muTest,'DisplayName','Short Selling allowed','XDataSource','muTest','YDataSource','volaShort');hold off;figure(gcf);
% Create xlabel
xlabel('volatility');
% Create ylabel
ylabel({'return'});
% Create title
title({'Efficient Frontier'});
