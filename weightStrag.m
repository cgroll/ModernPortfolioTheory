function [tCost] = weightStrag(data,weightMat)
% WEIGHTSTRAG calculate transaction cost for given weight Matrix and data  
% Input: 
% data           table    
% weight         double mxn
%
% Output: 
% retP           double mx1
% transCost      double 1x1      

rets = data{:,:}; 
[nObs ,nAss ] = size(rets);
weightAuto = zeros(nObs,nAss); 
retP = zeros(nObs,1); 
tCost = 0; 

for tt = 1:nObs-1   
    
    % calculate new weigth
    weightAuto(tt+1,:) = weightMat(tt,:).*(1+rets(tt,:))./(1+retP(tt));
    
    % calculate portfolio return
    retP(tt+1)  = weightAuto(tt+1,:)*rets(tt+1,:)';
    
    % calculate transaction cost
    tCost = tCost + sum (abs(weightAuto(tt+1,:)-weightMat(tt+1,:)));

end


end