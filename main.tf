# Terraform
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.40.0"
    }
  }
}

data "azurerm_management_group" "target_management_group" {
  name = var.management_group_policy
}
