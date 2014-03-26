function tests = testInformationExtraction
% test functions that decompose and create tables
tests = functiontests(localfunctions);
end

function testSplitAndCombine(testCase)
discRet = loadRets();
[vals, stockNames, dates] = splitTable(discRet);
outputTable = combineTable(vals,stockNames,dates);

verifyEqual(testCase, discRet, outputTable)
end