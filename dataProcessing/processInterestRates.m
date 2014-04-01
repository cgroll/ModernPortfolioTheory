function processInterestRates()
%processInterestRates transform rates to daily horizon, join them with
%return dates and save result to disk
%
% Inputs:
%   
%
% Outputs:
%   side effects: processed data written to file   
%

% set directory name for data
dirName = 'Interest Rates/';

%% bring in data
prime = readCsv_Prime([dirName 'fredgraph_bank_prime_loan_rate.csv']);
libor = readCsv_Libor([dirName 'fredgraph_libor_1month_usd.csv']);

%% transform percentage annualized returns to non-percentage daily values
annToDaily = @(x) (1 + (x/100)).^(1/250) - 1;

primeDailised = annToDaily(prime.interestRate);
liborDailised = annToDaily(libor.libor);

%% join interest rates as tables
liborTable = table(libor.date, liborDailised);
primeTable = table(prime.date, primeDailised);

interestWithDates = outerjoin(liborTable, primeTable, 'keys', 'Var1', ...
    'MergeKeys', true);

%% join interest rates with returns
returns = loadRets();

returnsWithDates = [table(datenum(returns.Properties.RowNames)), returns];
returnsInterest = join(returnsWithDates, interestWithDates, 'Keys', 'Var1');

%% impute missing interest data
% missing value will be replace by last available value
% no missing values at the beginning

for ii = 1:height(returnsInterest)
    if isnan(returnsInterest{ii,350})
        returnsInterest{ii,350} = returnsInterest{ii-1,350};
    end
    if isnan(returnsInterest{ii,351})
        returnsInterest{ii,351} = returnsInterest{ii-1,351};
    end
end

%% save data
% complete table as csv: returns and interest rates
writetable(returnsInterest, 'Interest Rates/returnsInterest.csv') 

% only interest rates
interestDailisedWriteTable = returnsInterest(:,[1 350 351]);
writetable(interestDailisedWriteTable, 'data/interestDailised.csv'); 

end