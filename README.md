# README

TODO:
1. write load data task
2. support account-transfer-transactions
2. controllers to visualize
3. Fix encoding and handle hebrew
4. automate download of excel files 
5. Need to assign "location" to all transactions? probably not.
9. Write readme
10. support PDF

Quick setup:
1. ParseIncomingDataJob.perform_now(source: :bank, file_location: './tmp/in/ZZZZZ.xlsx'
2. SaveParsedDataJob.perform_now
3. 