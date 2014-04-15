function tests = testRandWeights
% unit tests for randWeights function
tests = functiontests(localfunctions);
end

function testMatr(testCase)
% create single portfolio as column vector
wgts = randWeights(10, 8);
checkWeights(wgts)

end