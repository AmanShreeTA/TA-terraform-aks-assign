terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.95.0"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
  skip_provider_registration = true
  # Configuration options
}

data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "az-key-vlt-tf" {
  name                        = "examplekeyvault-tf"
  location                    = "East US"
  resource_group_name         = ""
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
  tags = {
    Environment  = ""
    created-by   = ""
    created-date = formatdate("EEE, DD MMM YYYY hh:mm:ss ZZZ",timestamp())
    created-for  = "terraform-testing"
  }
}

