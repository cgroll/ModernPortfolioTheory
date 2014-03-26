function tests = testCheckWeights
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
tests = functiontests(localfunctions);
end
%     function throwsException(testCase)
%         weightMatrixF = rand(200,10);
%         
%     end


function testValidInput(testCase)
weightMatrixF = rand(200,10);
sumCol = sum(weightMatrixF, 2);
sumMatrix = sumCol*ones(1,10);
weightMatrixT = weightMatrixF./sumMatrix;

checkWeights(weightMatrixT);
% actResult = checkWeights(weightMatrixT);
% verifyEqual(testCase, actResult, true);
end
% 

function testInvalidInput(testCase)
% import matlab.unittest.TestCase;
% import matlab.unittest.constraints.Throws;

weightMatrixF = rand(200,10);
% testCase.verifyThat(@() error('SOME:error:id','Error!'), ...
%     Throws('SOME:error:id'));

verifyError(testCase, @() checkWeights(weightMatrixF), 'portf:weights');
% actResult = checkWeights(weightMatrixF);
% verifyEqual(testCase, actResult, false);
end