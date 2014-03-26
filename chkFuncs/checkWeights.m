function checkWeights(weightsMatrix)
% This function checks if the weights of the shares in a protfolio sum to one.
% Inputs:
%   weightsMatrix   nxm matrix or table.
%                   The weights are denoted in rows.
%
% Outputs:
%   result          error message if portfolio weights do not sum to one 

% result = true;

% tolerance level
tolEps = 1e-6;

if istable(weightsMatrix)
    weightsMatrix = weightsMatrix{:, :};
end

% column vector / row vector?
if size(weightsMatrix, 2) == 1
    % if column vector, transpose
    weightsMatrix = weightsMatrix';
end

% no column vector may exist anymore

% get rid of for-loop
sumRows = sum(weightsMatrix, 2);
    if any(abs(sumRows - 1) > tolEps)
    %         result = false;
        error('portf:weights','portfolio weights do not sum to one!')
    end

% for ii=1:size(weightsMatrix, 1)   
%     if abs(sum(weightsMatrix(ii, :)) - 1) > tolEps
% %         result = false;
%         error('portf:weights','portfolio weights do not sum to one!')
%     end
% end


end

