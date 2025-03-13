variable "subscriptions" {
  description = "subscription details"
  type = map(object({
    name                          = optional(string)
    alias                         = optional(string)
    billing_scope_id              = optional(string)
    subscription_id               = optional(string)
    workload                      = optional(string)
    tags                          = optional(map(string))
    management_group_name         = optional(string)
    management_group_display_name = optional(string)
    management_lock = optional(object({
      name  = optional(string)
      level = optional(string)
      notes = optional(string)
    }))
  }))
}

variable "billing_mca_account" {
  description = "billing mca account details"
  type = object({
    billing_account_name = string
    billing_profile_name = string
    invoice_section_name = string
  })
  nullable = true
  default  = null
}

variable "billing_enrollment_account" {
  description = "billing enrollment account details"
  type = object({
    billing_account_name    = string
    enrollment_account_name = string
  })
  nullable = true
  default  = null
}

variable "billing_mpa_account" {
  description = "billing mpa account details"
  type = object({
    billing_account_name = string
    customer_name        = string
  })
  nullable = true
  default  = null
}

variable "tags" {
  description = "tags to be added to the subscription(s)"
  type        = map(string)
  default     = {}
}
