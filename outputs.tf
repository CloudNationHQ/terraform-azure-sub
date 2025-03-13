output "subscriptions" {
  description = "subscription(s) details"
  value       = azurerm_subscription.subs
}

output "management_group_subscription_associations" {
  description = "management group subscription associations"
  value       = azurerm_management_group_subscription_association.subs
}

output "management_group" {
  description = "management group details"
  value       = data.azurerm_management_group.group
}
