loadData;

%%
maxDraw = maxDrawdown(discRet(:,1));
%  maxDrawdownStandardized: -0.5437 can be interpreted as the price dropped 
% at most  about 54% 

%prices=cumprod(discRet{:,1}+1);
%plot(prices);
%hold on;
%plot(maxDraw.Index(1):maxDraw.Index(2) ,prices(maxDraw.Index(1):maxDraw.Index(2)), 'color','red');
% algorithm works!

plotMaxDrawdown(maxDraw, discRet(:,1));

%% log
for ii=[2 12] %2,12
maxDrawLog = maxDrawdown(discRet(:,ii), true);
plotMaxDrawdown(maxDrawLog, discRet(:,ii));
hold on;
end 
hold off;

%% wikipedia algorithm
maxDrawWiki = maxDrawdownWiki(discRet(:,1)); 

%% for a table
% doesn't work
%drawTable = varfun(@(x) maxDrawdown(x), discRet);
% works
drawTable = varfun(@(x) maxDrawdownWiki(x), discRet(1:5,1:6))
drawTable{1,1} % for first asset
%struct2table(drawTable) % not work