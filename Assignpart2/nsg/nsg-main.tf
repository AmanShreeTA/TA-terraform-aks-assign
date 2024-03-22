terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.95.0"
    }
  }
}

provider "azurerm" {
    skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
    features {}
  # Configuration options
}

resource "azurerm_network_security_group" "nsg-tf-sample" {
    name                = "TfNetSecurityGroup1"
    location            = "East US"
    resource_group_name = "DevOps-training"
    
    security_rule {
    name                       = "allowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "allow8080p"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    Environment  = "Testing"
    created-by   = "Aman"
    created-date = formatdate("EEE, DD MMM YYYY hh:mm:ss ZZZ",timestamp())
    created-for  = "terraform-testing"
  }
}