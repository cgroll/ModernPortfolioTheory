function [structValues] = maxDrawdown(discRet)
% calculates maximum drawdown by searching highest and lowest point of 
% price data (= converted percentage returns) and then look for the highest
% value before the lowest and the lowest after the hightest. The bigger
% difference should be the maximum drawdown
% algorithm bullshit!!

% alternative algorithm:
% find for every observation the lowest price that comes afterwards
% and determine the lowest difference
%
% input: disc returns (vector)
% output: struct with maximum drawdown as period and value

% convert to matrix if table
if istable(discRet)
    discRet = discRet{:,:};
end

%calclulate price values (value for t=0 is set to 1)
ret = discRet+1;
price = cumprod(ret); % starting with t=1


% calculate measures
maximum = max(price);
minimum = min(price);
maximumIndex = find(price == maximum);
minimumIndex = find(price == minimum);
minAfterMax = min(price(maximumIndex:end));
maxBeforeMin = max(price(1:minimumIndex));
minAfterMaxIndex = find(price == minAfterMax);
maxBeforeMinIndex = find(price == maxBeforeMin);

maxDraw1 = minAfterMax - maximum;
maxDraw2 = minimum - maxBeforeMin;
maxDraw = min([maxDraw1, maxDraw2]);

if(maxDraw1 < maxDraw2) 
    maxDrawStart = maximumIndex;
    maxDrawEnd = minAfterMaxIndex;
else
    maxDrawStart = maxBeforeMinIndex;
    maxDrawEnd = minimumIndex;
end


% create return struct
structValues = struct('maximumDrawdown', maxDraw,...
    'Index', [maxDrawStart, maxDrawEnd]);
end