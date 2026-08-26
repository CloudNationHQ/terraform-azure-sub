moved {
  from = azurerm_subscription.sub["subscription"]
  to   = azurerm_subscription.this["this"]
}

moved {
  from = azurerm_management_group_subscription_association.sub["default"]
  to   = azurerm_management_group_subscription_association.this["this"]
}

moved {
  from = azurerm_management_lock.lock["default"]
  to   = azurerm_management_lock.this["this"]
}
