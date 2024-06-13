Simple Powershell script for updating Exchange Online user permissions to a Shared calendar.

Relevant background information:
The script assumes you have output a CSV of the Exchange Online (EXO) Users with at minimum a single column for the "Alias" from the EXO server, and it is stored in the same directory as the script.

$user variable assumes each entry has the "Alias" column with a header in your CSV.

It also assumes that you have already logged into ("Connected to") the Exchange Online Management Powershell, more info on that [here](https://learn.microsoft.com/en-us/powershell/exchange/connect-to-exchange-online-powershell?view=exchange-ps).
