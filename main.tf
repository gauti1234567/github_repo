terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"

    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rgs" {
  for_each = var.rgs
  name     = each.value.name
  location = each.value.location

}

resource "azurerm_storage_account" "stgs" {
  for_each                 = var.stgs
  depends_on               = [azurerm_resource_group.rgs]
  name                     = each.value.name
  location                 = each.value.location
  resource_group_name      = each.value.resource_group_name
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type

}
