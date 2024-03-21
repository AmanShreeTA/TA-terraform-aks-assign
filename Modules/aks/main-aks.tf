
resource "azurerm_kubernetes_cluster" "example" {
  name                = var.aks-cluster-name
  location            = var.rs-location
  resource_group_name = var.rg-name
  dns_prefix          = "testing-exampledns1"

  default_node_pool {
    name                = "default"
    node_count          = var.node-count
    min_count           = var.min-nodes
    max_count           = var.max-nodes
    max_pods            = var.max-pods
    vm_size             = var.vm-size
    type                = "VirtualMachineScaleSets" #by default the type parameter is set to VirtualMachineScaleSets
    enable_auto_scaling = true
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment  = var.env
    created-by   = var.your-name
    created-date = formatdate("EEE, DD MMM YYYY hh:mm:ss ZZZ",timestamp())
    created-for  = "terraform-testing"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "aks-node-pool" {
  name                  = "vmsspool"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.example.id
  vm_size               = var.vm-size
  node_count            = var.node-count
  min_count             = var.min-nodes
  max_count             = var.max-nodes
  enable_auto_scaling = true
  zones = []
  max_pods = var.max-pods
  tags = {
    Environment  = var.env
    created-by   = var.your-name
    created-date = formatdate("EEE, DD MMM YYYY hh:mm:ss ZZZ",timestamp())
    created-for  = "terraform-testing"
  }
}

output "aks-cluster-name" {
  value = azurerm_kubernetes_cluster.example.name
}