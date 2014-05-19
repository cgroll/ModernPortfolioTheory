function [ volatility ] = eGarchVolatilityEstimation(parameters, data)
%estimates volatility of data by eGarch(1,1)-Model for given parameters
%   Detailed explanation goes here
 mu =parameters(1);
 alpha0 =parameters(2);
 alpha1 =parameters(3);
 gamma =parameters(4);
 beta =parameters(5);
 n = length(data);
    
 innovations = data - mu;
 normalizedInnovations = zeros(n,1);
 sigmaSquared  = zeros(n,1);
 logSigmaSquared = zeros(n,1);


 sigmaSquared(1) = innovations(1)^2;
 logSigmaSquared(1) = log(sigmaSquared(1));
    
 for i=2:n
    
   normalizedInnovations(i-1) = innovations(i-1)/sqrt(sigmaSquared(i-1));
  
   logSigmaSquared(i) = alpha0 + alpha1 * (abs(normalizedInnovations(i-1)) - sqrt(2/pi)) + gamma * normalizedInnovations(i-1) + beta * logSigmaSquared(i-1);
   sigmaSquared(i) = exp(logSigmaSquared(i));
 end 

volatility = sqrt(sigmaSquared);


end

