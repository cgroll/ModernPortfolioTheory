maxDraw = maxDrawdown(discRet(:,1));
prices=cumprod(discRet{:,1}+1);
plot(prices);
hold on;
plot(maxDraw.Index(1):maxDraw.Index(2) ,prices(maxDraw.Index(1):maxDraw.Index(2)), 'color','red');
% algorithm works!