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
  for_each = {
    for key, sub in var.subscriptions : key => sub if try(sub.management_group_name, null) != null || try(sub.management_group_display_name, null) != null
  }

  name         = try(each.value.management_group_name, null)
  display_name = try(each.value.management_group_display_name, null)
}

resource "azurerm_management_group_subscription_association" "subs" {
  for_each = {
    for key, sub in var.subscriptions : key => sub if try(sub.management_group_name, null) != null || try(sub.management_group_display_name, null) != null
  }

  management_group_id = data.azurerm_management_group.group[each.key].id
  subscription_id     = "/subscriptions/${azurerm_subscription.subs[each.key].subscription_id}"
}

resource "azurerm_subscription" "subs" {
  for_each = {
    for key, sub in var.subscriptions : key => sub
  }

  subscription_name = try(each.value.name, each.key)
  alias             = try(each.value.alias, null)
  billing_scope_id = try(each.value.billing_scope_id, null) != null ? each.value.billing_scope_id : try(var.billing_mca_account, null) != null ? data.azurerm_billing_mca_account_scope.mca["default"].id : try(
    var.billing_enrollment_account, null) != null ? data.azurerm_billing_enrollment_account_scope.enrollment["default"].id : try(
  var.billing_mpa_account, null) != null ? data.azurerm_billing_mpa_account_scope.mpa["default"].id : null
  subscription_id = try(each.value.subscription_id, null)
  workload        = try(each.value.workload, "Production")
  tags            = coalesce(try(each.value.tags, {}), var.tags)
}

# locks
resource "azurerm_management_lock" "lock" {
  for_each = {
    for key, sub in var.subscriptions : key => sub if try(sub.management_lock != null, false)
  }

  name  = try(each.value.management_lock.name, "lock-${each.key}")
  scope = azurerm_subscription.subs[each.key].id


  lock_level = try(each.value.management_lock.level, "CanNotDelete")
  notes      = try(each.value.management_lock.notes, null)
}
