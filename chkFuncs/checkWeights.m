function checkWeights(weightsMatrix)

% result = true;

% tolerance level
tolEps = 1e-6;

% column vector / row vector?
if size(weightsMatrix, 2) == 1;
    % if column vector, transpose
    weightsMatrix = weightsMatrix';
end

% no column vector may exist anymore

for ii=1:size(weightsMatrix, 1)   
    if abs(sum(weightsMatrix(ii, :)) - 1) > tolEps;
%         result = false;
        error('portf:weights','portfolio weights do not sum to one!')
    end
end

end

