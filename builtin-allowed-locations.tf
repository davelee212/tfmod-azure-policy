variable "allowedLocations" {
    type = list(string)
    default = ["uksouth", "ukwest", "westeurope", "northeurope"]
    description = "Azure Regions that can be deployed into"
}


resource "azurerm_policy_assignment" "allowed-locations" {
  name                 = "allowed-locations"
  scope                = data.azurerm_management_group.target_management_group.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e56962a6-4747-49cd-b67b-bf8b01975c4c"
  display_name         = "Allowed locations"

  parameters = <<PARAMETERS
    {
      "listOfAllowedLocations": {
        "value": ${jsonencode(var.allowedLocations)}
      }
    } 
  PARAMETERS
}
