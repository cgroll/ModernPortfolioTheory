function [structValues] = maxDrawdown(discRet, logRet)
% calculates maximum drawdown by searching for the lowest price following
% each observation and determine the biggest difference. if logRet = true it 
% searches for the biggest difference of the logarithmic "prices".

% input: disc returns (vector)
% output: struct with maximum drawdown as period (indices) and value

% convert to matrix if table
if istable(discRet)
    discRet = discRet{:,:};
end

%calclulate price values (value for t=0 is set to 1)
ret = discRet+1;
price = cumprod(ret); % starting with t=1

if logRet==true
    price = log (price);
end

% calculate measures
% find minimum after each value
minimum = zeros(length(price),1);
for (i = 1:length(price))
    minimum(i) = min(price(i:end));
end
% find maximum drawdown starting with every value
drawdowns = minimum-price;
% find global max drawdown
maxDrawdown = min(drawdowns);

% find indices
indexStart = find(drawdowns == maxDrawdown,1);
%disp(num2str(indexStart)) %%% problems if maxDrawdown occurs several
%times
indexEnd = find(price == minimum(indexStart));

% compute standardized maximum drawdown
% (normal max drawdown is only in relation to the first price value
% instead of to the price right before the drawdown)
maxDrawdownStandard = maxDrawdown / price(indexStart);

% create return struct
structValues = struct('maximumDrawdown', maxDrawdown,...
    'maxDrawdownStandardized', maxDrawdownStandard,...
    'Index', [indexStart, indexEnd]);
end