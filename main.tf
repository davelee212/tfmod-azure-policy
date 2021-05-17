# Terraform
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.40.0"
    }
  }
}

#create resource group
resource "azurerm_resource_group" "rg" {
    name     = var.resource_group_name
    location = var.location
}
