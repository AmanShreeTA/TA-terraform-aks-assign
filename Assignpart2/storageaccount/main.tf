terraform {
    required_providers {
        azurerm = {
        source = "hashicorp/azurerm"
        version = "3.95.0"
        }
    }
}

provider "azurerm" {
    features {}
    skip_provider_registration = true
      # Configuration options
}

resource "random_integer" "rint" {
    min = 40000
    max = 99999
}

resource "azurerm_storage_account" "state-storage" {
    name = "storagetf${random_integer.rint.id}"
    resource_group_name = ""
    location = "East US"
    account_tier = "Standard"
    account_replication_type = "LRS"

    tags = {
        created-by = ""
        created-date = formatdate("EEE, DD MMM YYYY hh:mm:ss ZZZ",timestamp())
        created-for = "terraform-testing"
    }
}

resource "azurerm_storage_container" "tf-container" {
    name = "testing-container"
    storage_account_name = azurerm_storage_account.state-storage.name
    container_access_type = "private"
}


output "stg-acc-name" {
    value = azurerm_storage_account.state-storage.name
}
