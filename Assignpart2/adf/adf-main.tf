terraform {
  required_providers{
    azurerm = {
        source  = "hashicorp/azurerm"
        version = "3.95.0"
    }
  }
}

provider "azurerm" {
    skip_provider_registration = true
    features {}
}

resource "azurerm_data_factory" "adf-example" {
    name = "adf-tf-sample"
    resource_group_name = "DevOps-training"
    location = "East US"

    tags = {
      Environment  = "Testing"
      created-by   = "Aman"
      created-date = formatdate("EEE, DD MMM YYYY hh:mm:ss ZZZ",timestamp())
      created-for  = "terraform-testing"
    }
}

output "adf-sample-id" {
    value = azurerm_data_factory.adf-example.id
  
}