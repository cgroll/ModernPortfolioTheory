%Prime=readCsv_Prime('fredgraph_bank_prime_loan_rate.csv')
prime=readCsv_Prime('fredgraph_bank_prime_loan_rate.csv');
datestr(prime.date(end,:)) % convert date-integer to string (or readable date)
%%
interestDecimal=prime.interestRate/100; % convert x percent to x/100
%%
primeDailised = (1+interestDecimal).^(1/250)-1; % convert annualised interest rates to "dailised" ones
primeDailised(1:10)

%% read Libor (1Month, usd)
libor = readCsv_Libor('fredgraph_libor_1month_usd.csv');
liborDecimal = libor.libor/100;
liborDailised = (1+liborDecimal).^(1/250)-1;
liborDailised(1:10)
(1+liborDailised(1:10)).^250

%% join as tables
liborTable = table(libor.date,liborDailised);
primeTable = table(prime.date, primeDailised);
interestTable = outerjoin(liborTable, primeTable);
interestTable(1:10,:)
liborTable(1:10,:)
primeTable(1:10,:)
interestTable((end-10):end,:)
%%
% sizeInterestTable=size(interestTable(:,1));
% allDates=cell(sizeInterestTable);
% for ii = 1: sizeInterestTable(1)
%     if

%% join with returns
returns=loadRets();

returns = [table(datenum(returns.Properties.RowNames)), returns];
interest = [table(interestTable.Var1_primeTable), interestTable];
interest.Var1_liborTable = [];
interest.Var1_primeTable = [];
returnsInterest = join(returns, interest);

%% impute missing interest data
% missing value will be replace by last available value
% no missing values at the beginning

%returnsInterestM=returnsInterest{:,:}

for ii = 1:height(returnsInterest)
    if isnan(returnsInterest{ii,350})
        returnsInterest{ii,350}=returnsInterest{ii-1,350};
    end
    if isnan(returnsInterest{ii,351})
        returnsInterest{ii,351}=returnsInterest{ii-1,351};
    end
end

% % begin obsolete
% %% save as csv
% interestDailised = returnsInterest(:, 350:351);
% interestDailised = [returnsInterest.Var1, interestDailised{:,:}];
% csvwrite('interestDailised.csv', interestDailised); % date values wrong 
% %include variable names manually in csv file
% % date liborDailised primeDailised
% %% read data set with
% interest=readInterestDailised2();
% % end obsolete

%% save table as csv
writetable(returnsInterest, 'returnsInterest.csv') % rownames lost, but contains columnames, date integer correct 
interestDailisedWriteTable = returnsInterest(:,[1 350 351]);
writetable(interestDailisedWriteTable, 'interestDailised.csv'); % also seems to work

%% read interest data
interest = readInterestDailised();
