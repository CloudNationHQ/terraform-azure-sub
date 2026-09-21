# existing subscription
data "azurerm_subscription" "this" {
  for_each = var.use_existing_subscription || var.subscription.use_existing_subscription ? { "this" = var.subscription } : {}

  subscription_id = each.value.subscription_id
}

# mca account
data "azurerm_billing_mca_account_scope" "this" {
  for_each = var.billing_mca_account != null ? { "this" = var.billing_mca_account } : {}

  billing_account_name = var.billing_mca_account.billing_account_name
  billing_profile_name = var.billing_mca_account.billing_profile_name
  invoice_section_name = var.billing_mca_account.invoice_section_name
}

# enrollment account
data "azurerm_billing_enrollment_account_scope" "this" {
  for_each = var.billing_enrollment_account != null ? { "this" = var.billing_enrollment_account } : {}

  billing_account_name    = var.billing_enrollment_account.billing_account_name
  enrollment_account_name = var.billing_enrollment_account.enrollment_account_name
}

# mpa account
data "azurerm_billing_mpa_account_scope" "this" {
  for_each = var.billing_mpa_account != null ? { "this" = var.billing_mpa_account } : {}

  billing_account_name = var.billing_mpa_account.billing_account_name
  customer_name        = var.billing_mpa_account.customer_name
}

# management group
data "azurerm_management_group" "this" {
  for_each = var.subscription.management_group_name != null || var.subscription.management_group_display_name != null ? { "this" = var.subscription } : {}

  name         = var.subscription.management_group_name
  display_name = var.subscription.management_group_display_name
}

# association
resource "azurerm_management_group_subscription_association" "this" {
  for_each = var.subscription.management_group_name != null || var.subscription.management_group_display_name != null ? { "this" = var.subscription } : {}

  management_group_id = data.azurerm_management_group.this["this"].id

  subscription_id = (var.use_existing_subscription || var.subscription.use_existing_subscription) ? "/subscriptions/${data.azurerm_subscription.this["this"].subscription_id}" : "/subscriptions/${azurerm_subscription.this["this"].subscription_id}"
}

# subscription
resource "azurerm_subscription" "this" {
  for_each = var.use_existing_subscription || var.subscription.use_existing_subscription ? {} : { "this" = var.subscription }

  subscription_name = each.value.name
  alias             = each.value.alias
  subscription_id   = each.value.subscription_id
  workload          = each.value.workload
  tags = coalesce(
    each.value.tags, var.tags
  )

  billing_scope_id = each.value.billing_scope_id != null ? each.value.billing_scope_id : var.billing_mca_account != null ? data.azurerm_billing_mca_account_scope.this["this"].id : var.billing_enrollment_account != null ? data.azurerm_billing_enrollment_account_scope.this["this"].id : var.billing_mpa_account != null ? data.azurerm_billing_mpa_account_scope.this["this"].id : null
}

# management lock
resource "azurerm_management_lock" "this" {
  for_each = var.subscription.management_lock != null ? { "this" = var.subscription } : {}

  name       = each.value.management_lock.name
  lock_level = each.value.management_lock.level
  notes      = each.value.management_lock.notes

  scope = (var.use_existing_subscription || var.subscription.use_existing_subscription) ? data.azurerm_subscription.this["this"].id : azurerm_subscription.this["this"].id
}
