variable "location" {
  type        = string
  description = "Azure location of resource group"
  default     = "westus2"
}

variable "resource_group_name" {
    type = string
    description = "Name of the Resource Group to deploy"
}
