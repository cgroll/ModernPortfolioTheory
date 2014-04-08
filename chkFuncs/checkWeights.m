function checkWeights(weightsMatrix)
%CHECKWEIGHTS throws error if portfolio weights do not sum to one
% Inputs:
%   weightsMatrix   nxm matrix or table, with individual portfolios in rows
%
% Outputs:
%   sideeffect      error message if portfolio weights do not sum to one 

% result = true;

% tolerance level
tolEps = 1e-6;

if istable(weightsMatrix)
    weightsMatrix = weightsMatrix{:, :};
end

% transpose if column vector
if size(weightsMatrix, 2) == 1
    % if column vector, transpose
    weightsMatrix = weightsMatrix';
end

% from here on no column vector may exist anymore

% get rid of for-loop
sumRows = sum(weightsMatrix, 2);
if any(abs(sumRows - 1) > tolEps)
    error('portf:weights','portfolio weights do not sum to one!')
end

end

