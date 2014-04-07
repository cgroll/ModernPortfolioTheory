function [structValues] = maxDrawdown(discRet)
% calculates maximum drawdown by searching for the lowest price following
% each observation and determine the biggest difference

% alternative algorithm:
% find for every observation the lowest price that comes afterwards
% and determine the lowest difference
%
% input: disc returns (vector)
% output: struct with maximum drawdown as period (indices) and value

% convert to matrix if table
if istable(discRet)
    discRet = discRet{:,:};
end

%calclulate price values (value for t=0 is set to 1)
ret = discRet+1;
price = cumprod(ret); % starting with t=1


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
indexStart = find(drawdowns == maxDrawdown);
indexEnd = find(price == minimum(indexStart));



% create return struct
structValues = struct('maximumDrawdown', maxDrawdown,...
    'Index', [indexStart, indexEnd]);
end