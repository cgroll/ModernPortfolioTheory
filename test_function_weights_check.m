
%WeightMatrix(2,:) = WeightMatrix(2,:)/sum(WeightMatrix(2,:));
sumCol = sum(weightMatrixF, 2);
sumMatrix = sumCol*ones(1,10);
weightMatrixT = weightMatrixF./sumMatrix;

sum(weightMatrixT,2); % every row sums to 1
weightVectorF = rand(10);
weightVectorT = weightVectorF/sum(weightVectorF);
weightTableF = array2table(weightMatrixF);
weightTableT = array2table(weightMatrixT);
rowfun(@sum,weightTableF, 'SeparateInputs',0)
%sum(WeightTableT,2); % undefined for table
% datenum(2013,1,1)+0:199,