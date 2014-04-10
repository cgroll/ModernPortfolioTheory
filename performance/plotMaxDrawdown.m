function [] = plotMaxDrawdown(maxDrawdownStruct, discRetVector)
% plots prices calculated from return series (table vector) and
% maximum drawdown period

% input: discrete return series as table (only 1 column), struct returned 
%        from maxDrawdown function
% output: none

prices=cumprod(discRetVector{:,:}+1);

% plot price series
%plot(prices);

% attempt to have x axis as date
 plot(datenum(discRetVector.Properties.RowNames), prices);
 datetick 'x';


xlabel ('time');
ylabel 'price';
title 'maximum drawdown';
hold on;

% plot maximum drawdown
%plot(maxDrawdownStruct.Index(1):maxDrawdownStruct.Index(2),...
%    prices(maxDrawdownStruct.Index(1):maxDrawdownStruct.Index(2)),...
%    'color','red');

%attempt to have x-axis as date
 plot(datenum(discRetVector.Properties.RowNames(maxDrawdownStruct.Index(1):maxDrawdownStruct.Index(2))),...
     prices(maxDrawdownStruct.Index(1):maxDrawdownStruct.Index(2)),...
     'color','red');
shg


end