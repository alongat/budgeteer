# README

TODO:
1. write load data task + example on generating new env
2. support account-transfer-transactions
3. Fix encoding and handle hebrew - DONE
4. automate download of excel files 
5. Need to assign "location" to all transactions? probably not.
8. Create category groups (?)
9. Write readme
10. support PDF
11. controllers to visualize
12. Simple UI
13. authentication SSO + user support model? mmmm
14. Dockerize and build scripts to run on some cloud/locally
15. Budgets per cateroy?


Quick setup:
1. ParseIncomingDataJob.perform_now(source: :bank, file_location: './tmp/in/ZZZZZ.xlsx'
2. SaveParsedDataJob.perform_now
3. 

Data model:
Account - Holds diffrent managed accounts, from Credit Cards, Cash and Savings Account
MTransaction - Terrible name for transaction done in specific account
Location - Another terrible name for the name of a place transaction took place
Category - 'Tag' for a type of expense (for example: Eating Out, Shopping, Electric Bills etc...)

Account has_many Transactions 
Transaction belongs to Location
Locations belongs_to_and_has_many Categories