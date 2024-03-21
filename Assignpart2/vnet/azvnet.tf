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

resource "azurerm_virtual_network" "my-vnet-tf" {
  name                = "example-network-tf"
  resource_group_name = ""
  location            = "East US"
  address_space       = ["10.0.0.0/16"]
  tags = {
    Environment  = ""
    created-by   = ""
    created-date = formatdate("EEE, DD MMM YYYY hh:mm:ss ZZZ",timestamp())
    created-for  = "terraform-testing"
  }
}
