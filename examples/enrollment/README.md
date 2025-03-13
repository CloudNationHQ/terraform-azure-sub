# Default

This example illustrates how to create a Enrollment subscription, a subscription with a Enterprise Agreement.

## Types

```hcl
subscriptions = map(object({
  name                          = string
  alias                         = optional(string)
  management_group_name         = optional(string)
  management_group_display_name = optional(string)
  billing_scope_id              = optional(string)
  workload                      = optional(string, "Production")
  tags                          = map(object)
}))

billing_mca_account = object({
    billing_account_name = string  # billing account id
    billing_profile_name = string  # billing profile id
    invoice_section_name = string  # invoice section id
  })
```

## Notes
