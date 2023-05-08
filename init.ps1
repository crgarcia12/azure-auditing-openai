# API Management service-specific details
$apimServiceName = "crgar-lza-apim"
$resourceGroupName = "crgar-lza-rg"
$eventHubConnectionString = "Endpoint=sb://xxxx.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=xxxxxx="

# Create logger
$context = New-AzApiManagementContext -ResourceGroupName $resourceGroupName -ServiceName $apimServiceName
New-AzApiManagementLogger -Context $context -LoggerId "OpenAIAudit" -Name "crgar-lza-hub" -ConnectionString $eventHubConnectionString -Description "Event hub logger with connection string"
