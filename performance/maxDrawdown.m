function [structValues] = maxDrawdown(discRet)
% calculate maximum drawdown in percent
%
% the algorithm searches for the lowest price following each each
% observation and determines the biggest difference in log prices. this
% differences in log prices is transformed into a discrete percentage
% return.
% 
% input: 
%   discRet     nObs x 1 vector or table of portfolio returns
% 
% output: struct with maximum drawdown as period (indices) and value

% convert to matrix if table
if istable(discRet)
     discRet = discRet{:,:};
end

%calculate price values (value for t=0 is set to 1)
ret = discRet+1;
price = cumprod(ret); % starting with t=1

price = log (price);

% calculate measures
% find minimum after each value
minimum = zeros(length(price),1);
for ii = 1:length(price)
    minimum(ii) = min(price(ii:end));
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

maxDrawdown = exp(maxDrawdown) - 1;

% create return struct
structValues = struct('maximumDrawdown', maxDrawdown,...
    'Index', [indexStart, indexEnd]);
end