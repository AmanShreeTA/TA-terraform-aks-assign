variable "aks-cluster-name" {
  type = string
#   default = "testing-example-aks1"
}

variable "rs-location" {
  type = string
  # default = "East US"
}

variable "rg-name" {
  # default = "DevOps-training"
}

variable "node-count" {
  type = number
#   default = 3
}

variable "max-nodes" {
  type = number
#   default = 5
}

variable "min-nodes" {
  type = number
#   default = 1
}

variable "max-pods" {
  type = number
#   default = 40
}

variable "vm-size" {
  default = "Standard_D2s_v3"
}

variable "env" {
  type = string
}

variable "your-name" {
  type = string
}