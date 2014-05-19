function [ estimatedParameters ] = eGarchParameterEstimation( data )
%calculates parameters of eGarch(1,1)-Model
%%

%estimation of parameters by minimizing negativ logLikelihood
estimatedParameters = fminsearch(@calobj,[mean(data),0.1,0.1,0.1,0.9]);

% function that estimates logLikelihood for given parameter 
   function logLikelihood = calobj(parameter)
    mu = parameter(1);
    alpha0 = parameter(2);
    alpha1 = parameter(3);
    gamma = parameter(4);
    beta = parameter(5);
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

    logLikelihood = 0.5 * sum(log(sigmaSquared(2:n)) + (normalizedInnovations(2:n).^2));
   end %calcobj

end

