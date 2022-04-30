[CmdletBinding()]
param (
    [string]
    $SubscriptionId = "218d1cb6-8ebc-43cf-b887-f8ffa083a7d8",

    [string]
    $TenantId = "63bba9bf-5820-408f-b151-c5ce0079c08b"
)

try {
    Set-AzContext -SubscriptionId $SubscriptionId -TenantId $TenantId -ErrorAction Stop
}
catch {
    throw $_
}

## Resource group
$rgDeployment = New-AzSubscriptionDeployment `
    -Name "aksrgdeploy" `
    -Location "WestEurope" `
    -TemplateFile "AKS/aks-rg.bicep" `

## AKS Cluster
$aksDeployment = New-AzResourceGroupDeployment `
    -Name "aksdeploy" `
    -ResourceGroupName "aksdev-rg" `
    -TemplateFile "AKS/aks-quickstart.bicep"
