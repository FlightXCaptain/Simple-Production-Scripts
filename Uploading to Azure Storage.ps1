#Needs Az module not AzureRM (Which is what azure automate uses by default)

$SubscriptionID = #""
$StorageAccountRG = #""
$StorageAccountName = #""
$StorageContainerName = #""
$LocalPath = #""

Select-AzSubscription -Subscription $SubscriptionID

$StorageAccountKey = (Get-AzStorageAccountKey -ResourceGroupname $StorageAccountRG -AccountName $StorageAccountName).value[0]

$DestinationContext = New-AzStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $StorageAccountKey

$ContainerSASURI = New-AzStorageContainerSASToken -Context $DestinationContext -ExpiryTime(get-date).AddSeconds(3600) -FullUri -Name $storageContainerName -Permission rw

Set-AzStorageBlobContent -File $LocalPath -Container $StorageContainerName -Context $DestinationContext -Force