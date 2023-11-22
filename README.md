# PD2023_week-2
Data Source Bank has a requirement to construct International Bank Account Numbers (IBANs), even for Transactions taking place in the UK.
We have all the information in separate fields, we just need to put it altogether in the following order: Country_code, Check_digits, Bank_code, Sort_code and Account_number.

Requirements
Input the data
In the Transactions table, there is a Sort Code field which contains dashes. We need to remove these so just have a 6 digit string 
Use the SWIFT Bank Code lookup table to bring in additional information about the SWIFT code and Check Digits of the receiving bank account 
Add a field for the Country Code 
Hint: all these transactions take place in the UK so the Country Code should be GB
Create the IBAN as above 
Hint: watch out for trying to combine sting fields with numeric fields - check data types
Remove unnecessary fields 
Output the data
