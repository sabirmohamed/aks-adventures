param location string = resourceGroup().location
param clusterName string = 'akspunk'

param nodeCount int = 2
param vmSize string = 'standard_d2s_v3'

resource aksCluster 'Microsoft.ContainerService/managedClusters@2021-03-01' = {
  name: clusterName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    kubernetesVersion: '1.19.7'
    dnsPrefix: 'dnsprefix'
    enableRBAC: true
    agentPoolProfiles: [
      {
        name: '${clusterName}agentpool1'
        count: nodeCount
        vmSize: vmSize
        mode: 'System'
      }
    ]
  }
}
