# existing subscription
data "azurerm_subscription" "existing" {
  for_each = var.use_existing_subscription || try(
    var.subscription.use_existing_subscription, false
  ) ? { "subscription" = var.subscription } : {}

  subscription_id = each.value.subscription_id
}

# mca account
data "azurerm_billing_mca_account_scope" "mca" {
  for_each             = try(var.billing_mca_account != null ? { default = var.billing_mca_account } : {}, {})

  billing_account_name = var.billing_mca_account.billing_account_name
  billing_profile_name = var.billing_mca_account.billing_profile_name
  invoice_section_name = var.billing_mca_account.invoice_section_name
}

# enrollment account
data "azurerm_billing_enrollment_account_scope" "enrollment" {
  for_each                = try(var.billing_enrollment_account != null ? { default = var.billing_enrollment_account } : {}, {})

  billing_account_name    = var.billing_enrollment_account.billing_account_name
  enrollment_account_name = var.billing_enrollment_account.enrollment_account_name
}

# mpa account
data "azurerm_billing_mpa_account_scope" "mpa" {
  for_each             = try(var.billing_mpa_account != null ? { default = var.billing_mpa_account } : {}, {})

  billing_account_name = var.billing_mpa_account.billing_account_name
  customer_name        = var.billing_mpa_account.customer_name
}

# management group
data "azurerm_management_group" "group" {
  for_each     = try(var.subscription.management_group_name, null) != null || try(var.subscription.management_group_display_name, null) != null ? { default = var.subscription } : {}

  name         = try(var.subscription.management_group_name, null)
  display_name = try(var.subscription.management_group_display_name, null)
}

# association
resource "azurerm_management_group_subscription_association" "sub" {
  for_each            = try(var.subscription.management_group_name, null) != null || try(var.subscription.management_group_display_name, null) != null ? { default = var.subscription } : {}

  management_group_id = data.azurerm_management_group.group["default"].id

  subscription_id = (var.use_existing_subscription || try(
    var.subscription.use_existing_subscription, false
  )) ? "/subscriptions/${data.azurerm_subscription.existing["subscription"].subscription_id}" : "/subscriptions/${azurerm_subscription.sub["subscription"].subscription_id}"
}

# subscription
resource "azurerm_subscription" "sub" {
  for_each = var.use_existing_subscription || try(
    var.subscription.use_existing_subscription, false
  ) ? {} : { "subscription" = var.subscription }

  subscription_name = each.value.name
  alias             = each.value.alias
  subscription_id   = each.value.subscription_id
  workload          = each.value.workload
  tags = coalesce(
    each.value.tags, var.tags
  )

  billing_scope_id = try(each.value.billing_scope_id, null) != null ? each.value.billing_scope_id : try(
    var.billing_mca_account, null) != null ? data.azurerm_billing_mca_account_scope.mca["default"].id : try(
    var.billing_enrollment_account, null) != null ? data.azurerm_billing_enrollment_account_scope.enrollment["default"].id : try(
  var.billing_mpa_account, null) != null ? data.azurerm_billing_mpa_account_scope.mpa["default"].id : null
}

# management lock
resource "azurerm_management_lock" "lock" {
  for_each   = try(var.subscription.management_lock, null) != null ? { default = var.subscription } : {}

  name       = each.value.management_lock.name
  lock_level = each.value.management_lock.level
  notes      = each.value.management_lock.notes

  scope = (var.use_existing_subscription || try(
    var.subscription.use_existing_subscription, false
  )) ? data.azurerm_subscription.existing["subscription"].id : azurerm_subscription.sub["subscription"].id
}
