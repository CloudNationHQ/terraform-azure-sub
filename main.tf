data "azurerm_billing_mca_account_scope" "mca" {
  for_each = try(var.billing_mca_account != null ? { default = var.billing_mca_account } : {}, {})

  billing_account_name = var.billing_mca_account.billing_account_name
  billing_profile_name = var.billing_mca_account.billing_profile_name
  invoice_section_name = var.billing_mca_account.invoice_section_name
}

data "azurerm_billing_enrollment_account_scope" "enrollment" {
  for_each = try(var.billing_enrollment_account != null ? { default = var.billing_enrollment_account } : {}, {})

  billing_account_name    = var.billing_enrollment_account.billing_account_name
  enrollment_account_name = var.billing_enrollment_account.enrollment_account_name
}

data "azurerm_billing_mpa_account_scope" "mpa" {
  for_each = try(var.billing_mpa_account != null ? { default = var.billing_mpa_account } : {}, {})

  billing_account_name = var.billing_mpa_account.billing_account_name
  customer_name        = var.billing_mpa_account.customer_name
}

data "azurerm_management_group" "group" {
  for_each = try(var.subscription.management_group_name, null) != null || try(var.subscription.management_group_display_name, null) != null ? { default = var.subscription } : {}

  name         = try(var.subscription.management_group_name, null)
  display_name = try(var.subscription.management_group_display_name, null)
}

resource "azurerm_management_group_subscription_association" "sub" {
  for_each = try(var.subscription.management_group_name, null) != null || try(var.subscription.management_group_display_name, null) != null ? { default = var.subscription } : {}

  management_group_id = data.azurerm_management_group.group["default"].id
  subscription_id     = "/subscriptions/${azurerm_subscription.sub.subscription_id}"
}

resource "azurerm_subscription" "sub" {
  subscription_name = var.subscription.name
  alias             = try(var.subscription.alias, null)
  subscription_id   = try(var.subscription.subscription_id, null)
  workload          = try(var.subscription.workload, "Production")
  tags              = coalesce(try(var.subscription.tags, {}), var.tags)

  billing_scope_id = try(var.subscription.billing_scope_id, null) != null ? var.subscription.billing_scope_id : try(
    var.billing_mca_account, null) != null ? data.azurerm_billing_mca_account_scope.mca["default"].id : try(
    var.billing_enrollment_account, null) != null ? data.azurerm_billing_enrollment_account_scope.enrollment["default"].id : try(
  var.billing_mpa_account, null) != null ? data.azurerm_billing_mpa_account_scope.mpa["default"].id : null
}

resource "azurerm_management_lock" "lock" {
  for_each = try(var.subscription.management_lock, null) != null ? { default = var.subscription } : {}

  name  = var.subscription.management_lock.name
  scope = azurerm_subscription.sub.id


  lock_level = try(var.subscription.management_lock.level, "CanNotDelete")
  notes      = try(var.subscription.management_lock.notes, null)
}
