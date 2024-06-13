# import CSV from same directory, see readme for assumptions
$users = Import-CSV -Path .\exchange-mailbox-users.csv

# remove any current permissions for the users, this is required as there is no "Replace" permissions cmdlet at this time
foreach ($user in $users) {
    Remove-MailboxFolderPermission -Identity Attendance:\Calendar -User $user.Alias -Confirm:$false
		<# -Confirm:False bypasses standard pause from cmdlet and assumes "Y" answer
		 Attendance:\Calendar is the location of the [Mailbox]:\[file] you are updating permissions on, \Calendar is default location for calendars in Office 365
		 #>
}

# add the relevant permissions, permissions list available [here](https://learn.microsoft.com/en-us/powershell/module/exchange/add-mailboxfolderpermission?view=exchange-ps#parameters)
foreach ($user in $users) {
    Add-MailboxFolderPermission -Identity Attendance:\Calendar -User $user.Alias -AccessRights Author
}
#end of script
