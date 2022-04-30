param location string = 'WestEurope'

targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'aks-rg'
  location: location
}
