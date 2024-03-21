variable "aks-name" {
  type = string
  description = "Name of the AKS Cluster"
}

variable "reso-loc" {
  type = string
  #   default = "East US"
  description = "Location where the resource will be created"
}

variable "rsgp-name" {
  type    = string
  default = "MyResourceGroup"
  description = "Resource Group Name"
}

variable "dflt-nodes" {
  type = number
  description = "Default no. of nodes in the node pool"
}

variable "max-no-nodes" {
  type = number
  description = "Max no. of nodes in the node pool"
}

variable "min-no-nodes" {
  type = number
  description = "Min no. of nodes in the node pool"
}

variable "no-o-pods" {
  type    = number
  default = 40
  description = "No. of pods in the node pool"
}

variable "vm-size-type" {
  type = string
  #   default = "Standard_D2s_v3"
  description = "Type of VM to be used"
}

variable "env" {
  type = string
  description = "Name of the environment(for Resource Tag)"
}

variable "your-name" {
  type = string
  description = "Your Name (for Resource Tag)"
}