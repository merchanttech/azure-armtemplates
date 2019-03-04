#Connects to azure and selects the MTM Subscription and sets it to default

Connect-AzureRmAccount
Get-AzureRmSubscription
Get-AzureRmSubscription  -SubscriptionId "e3aa9fd7-0f08-42c4-ac78-fa574e17bd19" | Set-AzureRmContext