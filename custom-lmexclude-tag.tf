resource "azurerm_policy_definition" "sixdegrees-vm-tag-lmexclude-asrtest-definition" {
  name         = "sixdegrees-vm-tag-lmexclude-asrtest"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Add 'lmexclude' tag to VMs with name ending '-test' (ASR failover test VMs) at creation time."
  management_group_name   = var.management_group_policy

  metadata = <<METADATA
    {
      "category": "Six Degrees"
    }
  METADATA

  policy_rule = <<POLICY_RULE
    {
      "if": {
          "allOf": [
              {
                  "field": "type",
                  "equals": "Microsoft.Compute/virtualMachines"
              },
              
              {
                  "field": "name",
                  "like": "*-test"
              }
          ]
      },
      "then": {
          "effect": "append",
          "details": [
          {
              "field": "tags[lmexclude]",
              "value": "true"
          }
          ]
      }
    }
  POLICY_RULE
}


resource "azurerm_policy_assignment" "sixdegrees-vm-tag-lmexclude-asrtest-assignment" {
  name                 = "6dg-lmexclude-tag"
  display_name         = "Add 'lmexclude' tag to VMs with name ending '-test' (ASR failover test VMs) at creation time."
  description          = "Assignment of lmexclude tag policy - test description"
  policy_definition_id = azurerm_policy_definition.sixdegrees-vm-tag-lmexclude-asrtest-definition.id
  scope                = data.azurerm_management_group.target_management_group.id
}
