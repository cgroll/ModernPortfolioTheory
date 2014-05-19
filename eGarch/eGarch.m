function [ volatility, estimatedParameters ] = eGarch( data )
%Estimates volatility by eGarch(1,1)-Model
%   Detailed explanation goes here

%calling function eGarchParameterEstimation
estimatedParameters = eGarchParameterEstimation(data);

%Calculation conditional Variance 
volatility = eGarchVolatilityEstimation(estimatedParameters, data);

end

