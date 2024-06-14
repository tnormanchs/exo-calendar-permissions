# import CSV from same directory, see readme for assumptions
$users = Import-CSV -Path .\exchange-mailbox-users.csv

# modify permissions for the users, permissions list available [here](https://learn.microsoft.com/en-us/powershell/module/exchange/add-mailboxfolderpermission?view=exchange-ps#parameters)
foreach ($user in $users) {
    Set-MailboxFolderPermission -Identity Attendance:\Calendar -User $user.Alias -AccessRights Author
		<#
		 Attendance:\Calendar is the location of the [Mailbox]:\[file] you are updating permissions on, \Calendar is default location for calendars in Office 365
		 #>
}

#end of script
