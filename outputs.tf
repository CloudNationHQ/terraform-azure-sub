output "subscriptions" {
  description = "Contains all subscription configuration"
  value = var.use_existing_subscription || try(
    var.subscription.use_existing_subscription, false
  ) ? data.azurerm_subscription.existing : azurerm_subscription.sub
}

output "management_group_subscription_associations" {
  description = "management group subscription associations"
  value       = azurerm_management_group_subscription_association.sub
}

output "management_group" {
  description = "management group details"
  value       = data.azurerm_management_group.group
}
