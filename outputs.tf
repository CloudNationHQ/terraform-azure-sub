output "subscription" {
  description = "Contains all subscription configuration"
  value       = var.use_existing_subscription || var.subscription.use_existing_subscription ? data.azurerm_subscription.this : azurerm_subscription.this
}

output "management_group_subscription_associations" {
  description = "management group subscription associations"
  value       = azurerm_management_group_subscription_association.this
}

output "management_group" {
  description = "management group details"
  value       = data.azurerm_management_group.this
}
