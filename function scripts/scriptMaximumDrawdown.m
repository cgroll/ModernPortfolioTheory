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

%% wikipedia algorithm
maxDrawWiki = maxDrawdownWiki(discRet(:,1));