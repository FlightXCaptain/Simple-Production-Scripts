#To set Shared mailbox OOF (Useful for holidays) Can also be used to set for multiple mailboxes.

Set-MailboxAutoReplyConfiguration -Identity 'Sharedmailbox@example.com' -AutoReplyState Scheduled -StartTime "12/25/2020 00:00:00" -EndTime "1/4/2021 00:00:01" -ExternalMessage 'Thank you for your email.
We are currently out of the office and will not return until 04/01/21. I assure you that all your emails will be answered as soon as we return.
Kind Regards,
'-InternalMessage 'Thank you for your email.
We are currently out of the office and will not return until 04/01/21. I assure you that all your emails will be answered as soon as we return.
Kind Regards,
'

#To Check Existing.
#Get-MailboxAutoReplyConfiguration -Identity ''