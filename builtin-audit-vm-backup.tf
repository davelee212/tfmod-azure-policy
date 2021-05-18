resource "azurerm_policy_assignment" "audit-vm-backup" {
  name                 = "audit-vm-backup"
  scope                = data.azurerm_management_group.target_management_group_name.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/013e242c-8828-4970-87b3-ab247555486d"
  display_name         = "Azure Backup should be enabled for Virtual Machines"

  parameters = <<PARAMETERS
    {
      "effect": {
        "value": "AuditIfNotExists"
      }
    }
  PARAMETERS
}
