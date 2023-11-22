/*Data Source Bank has a requirement to construct International Bank Account Numbers (IBANs), even for Transactions taking place in the UK.
We have all the information in separate fields, we just need to put it altogether in the following order:
COUNTRY_CODE, CHECK_DIGITS,BANK_CODE, SORT_CODE and ACCOUNT_NO*/

--SWIFT
SELECT * FROM 
TIL_PLAYGROUND.PREPPIN_DATA_INPUTS.PD2023_WK02_SWIFT_CODES;

--TRANSACTIONS
SELECT * FROM 
TIL_PLAYGROUND.PREPPIN_DATA_INPUTS.PD2023_WK02_TRANSACTIONS;

--1.In the Transactions table, there is a Sort Code field which contains dashes.
--We need to remove these so just have a 6 digit string
--2.Use the SWIFT Bank Code lookup table to bring in additional information about the SWIFT code and Check Digits of the receiving bank account
--3.Add a field for the Country Code
select transaction_id, iban
    From(
    SELECT replace(sort_code, '-','') as sort, transaction_id 
      ,swift_code
      ,check_digits
      ,'GB' as country_code
      ,concat(country_code,check_digits, swift_code, sort, account_number) as iban
FROM TIL_PLAYGROUND.PREPPIN_DATA_INPUTS.PD2023_WK02_TRANSACTIONS t
join TIL_PLAYGROUND.PREPPIN_DATA_INPUTS.PD2023_WK02_SWIFT_CODES s on t.bank=s.bank);

 
