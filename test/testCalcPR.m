function tests = testCalcPR
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
tests = functiontests(localfunctions);
end

function testInvalidDimensions(testCase)
%input
vals = rand(3);
valsWeights = rand(4);

%expected output
verifyError(testCase, @() CalcPR(vals,valsWeights), 'portf:dimMismatch');
end 

function testInvalidDates(testCase)
% input

%define entries for Date and Names
datesVals=['01-01-2014'; '02-02-2014'];
datesWeights=['02-01-2014'; '01-02-2014']; % this is where the mismatch is about to happen
nameVals=['A';'B';'C'];
nameWeights=['A';'B';'C'];

%define data
weights=[0.25,0.25,0.5;0.5,0.25,0.25];
vals=[10,20,30;5,10,15];

%create table for "weights"
tableWeights=array2table(weights);
tableWeights.Properties.RowNames = cellstr(datesWeights);
tableWeights.Properties.VariableNames = cellstr(nameWeights);

%create table for "data"
tableData=array2table(vals);
tableData.Properties.RowNames = cellstr(datesVals);
tableData.Properties.VariableNames = cellstr(nameVals);

%expected output
verifyError(testCase, @() CalcPR(tableData,tableWeights), 'portf:DateMismatch');
end 

function testInvalidNames(testCase)
% input

%define entries for Date and Names
datesVals=['01-01-2014'; '02-02-2014'];
datesWeights=['01-01-2014'; '02-02-2014']; 
nameVals=['A';'B';'C'];
nameWeights=['A';'C';'B'];

%define data
weights=[0.25,0.25,0.5;0.5,0.25,0.25];
vals=[10,20,30;5,10,15];

%create table for "weights"
tableWeights=array2table(weights);
tableWeights.Properties.RowNames = cellstr(datesWeights);
tableWeights.Properties.VariableNames = cellstr(nameWeights);

%create table for "data"
tableData=array2table(vals);
tableData.Properties.RowNames = cellstr(datesVals);
tableData.Properties.VariableNames = cellstr(nameVals);

%expected output
verifyError(testCase, @() CalcPR(tableData,tableWeights), 'portf:NamesMismatch');
end 

function testCalculation(testCase)
% input

%define entries for Date and Names
datesVals=['01-01-2014'; '02-02-2014'];
datesWeights=['01-01-2014'; '02-02-2014'];
nameVals=['A';'B';'C'];
nameWeights=['A';'B';'C'];

%define data
weights=[0.25,0.25,0.5;0.5,0.25,0.25];
vals=[10,20,30;5,10,15];

%create table for "weights"
tableWeights=array2table(weights);
tableWeights.Properties.RowNames = cellstr(datesWeights);
tableWeights.Properties.VariableNames = cellstr(nameWeights);

%create table for "data"
tableData=array2table(vals);
tableData.Properties.RowNames = cellstr(datesVals);
tableData.Properties.VariableNames = cellstr(nameVals);

%expected output
arrayPR=[22.5;8.75];
tablePR=array2table(arrayPR);
tablePR.Properties.RowNames = cellstr(datesWeights);
tablePR.Properties.VariableNames = cellstr('PortfRet');

%output
outputAct=CalcPR(tableData,tableWeights);

verifyEqual(testCase,outputAct, tablePR);
end 





