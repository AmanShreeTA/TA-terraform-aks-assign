terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.95.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  # Configuration options
}

resource "azurerm_databricks_workspace" "dbricks-workspace" {
  name = "databricks-test-tf"
  resource_group_name = ""
  location = "East US"
  sku = "standard"
  tags = {
    Environment  = ""
    created-by   = ""
    created-date = formatdate("EEE, DD MMM YYYY hh:mm:ss ZZZ",timestamp())
    created-for  = "terraform-testing"
  }
}
