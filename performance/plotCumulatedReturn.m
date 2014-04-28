function plotCumulatedReturn(discRet)
%plotCumulatedReturn plot normalized prices
%   Detailed explanation goes here
% Inputs:
%   discRet     table
%
% Outputs:
%   none

if istable(discRet) == 0
    error('Input is not from type table')
end

    
values = discRet{:,:};
grossRet = values + 1;
normPrices = 100*cumprod(grossRet);

dates = discRet.Properties.RowNames;
datesAsNumbers = datenum(dates);

plot(datesAsNumbers, normPrices)
datetick 'x'

end

