function [structValues] = maxDrawdownWiki(discRet)
% calculates maximum drawdown by using the algorithm from the wikipedia
% article "drawdown (economics)"


%
% input: disc returns (vector)
% output: struct with maximum drawdown in percent

% convert to matrix if table
if istable(discRet)
    discRet = discRet{:,:};
end

%calclulate price values (value for t=0 is set to 1)
ret = discRet+1;
price = cumprod(ret); % starting with t=1

% algorithm as pseudocode from http://en.wikipedia.org/wiki/Maximum_drawdown
% MDD = 0
% peak = -99999
% for i = 1 to N step 1
%   if (NAV[i] > peak) # peak will be the maximum value seen so far (0 to i)
%     peak = NAV[i]
%   endif
%   DD[i] = 100.0 * (peak - NAV[i]) / peak
%   if (DD[i] > MDD) # Same idea as peak variable, MDD keeps track of the maximum drawdown so far.
%     MDD = DD[i]
%   endif
% endfor

MDD = 0;
peak = -99999;
DD = zeros(length(price));

for i = 1:length(price)
    if (price(i) > peak)
        peak = price(i);
    end
    DD(i) = 100 * (peak - price(i)) / peak;
    if (DD(i) > MDD)
        MDD = DD(i);
    end
end


% % calculate measures
% % find minimum after each value
% minimum = zeros(length(price),1);
% for (i = 1:length(price))
%     minimum(i) = min(price(i:end));
% end
% % find maximum drawdown starting with every value
% drawdowns = minimum-price;
% % find global max drawdown
% maxDrawdown = min(drawdowns);
% 
% % find indices
% indexStart = find(drawdowns == maxDrawdown);
% indexEnd = find(price == minimum(indexStart));
% 
% % compute standardized maximum drawdown
% % (normal max drawdown is only in relation to the first price value
% % instead of to the price right before the drawdown)
% maxDrawdownStandard = maxDrawdown / price(indexStart);
% 
% % create return struct
% structValues = struct('maximumDrawdown', maxDrawdown,...
%     'maxDrawdownStandardized', maxDrawdownStandard,...
%     'Index', [indexStart, indexEnd]);

structValues = struct('maximumDrawdown', MDD);
end