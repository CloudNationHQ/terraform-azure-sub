# Subscription

This terraform module simplifies the process of creating and managing subscriptions on azure with customizable options and features, offering a flexible and powerful solution for managing azure subscriptions through code.

## Goals

The main objective is to create a more logic data structure, achieved by combining and grouping related resources together in a complex object.

The structure of the module promotes reusability. It's intended to be a repeatable component, simplifying the process of building diverse workloads and platform accelerators consistently.

A primary goal is to utilize keys and values in the object that correspond to the REST API's structure. This enables us to carry out iterations, increasing its practical value as time goes on.

A last key goal is to separate logic from configuration in the module, thereby enhancing its scalability, ease of customization, and manageability.

## Non-Goals

These modules are not intended to be complete, ready-to-use solutions; they are designed as components for creating your own patterns.

They are not tailored for a single use case but are meant to be versatile and applicable to a range of scenarios.

Security standardization is applied at the pattern level, while the modules include default values based on best practices but do not enforce specific security standards.

End-to-end testing is not conducted on these modules, as they are individual components and do not undergo the extensive testing reserved for complete patterns or solutions.

## Features

- offers support for the creation of MCA subscriptions and enrollment (EA) subscriptions.
- provides support for creatin gmultiple subscriptions at once.
- implements optional management locks for enhanced security.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 4.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_management_group_subscription_association.subs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group_subscription_association) | resource |
| [azurerm_management_lock.lock](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock) | resource |
| [azurerm_subscription.subs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subscription) | resource |
| [azurerm_billing_enrollment_account_scope.enrollment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/billing_enrollment_account_scope) | data source |
| [azurerm_billing_mca_account_scope.mca](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/billing_mca_account_scope) | data source |
| [azurerm_billing_mpa_account_scope.mpa](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/billing_mpa_account_scope) | data source |
| [azurerm_management_group.group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/management_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_enrollment_account"></a> [billing\_enrollment\_account](#input\_billing\_enrollment\_account) | billing enrollment account details | <pre>object({<br/>    billing_account_name    = string<br/>    enrollment_account_name = string<br/>  })</pre> | `null` | no |
| <a name="input_billing_mca_account"></a> [billing\_mca\_account](#input\_billing\_mca\_account) | billing mca account details | <pre>object({<br/>    billing_account_name = string<br/>    billing_profile_name = string<br/>    invoice_section_name = string<br/>  })</pre> | `null` | no |
| <a name="input_billing_mpa_account"></a> [billing\_mpa\_account](#input\_billing\_mpa\_account) | billing mpa account details | <pre>object({<br/>    billing_account_name = string<br/>    customer_name        = string<br/>  })</pre> | `null` | no |
| <a name="input_subscriptions"></a> [subscriptions](#input\_subscriptions) | subscription details | <pre>map(object({<br/>    name                          = optional(string)<br/>    alias                         = optional(string)<br/>    billing_scope_id              = optional(string)<br/>    subscription_id               = optional(string)<br/>    workload                      = optional(string)<br/>    tags                          = optional(map(string))<br/>    management_group_name         = optional(string)<br/>    management_group_display_name = optional(string)<br/>    management_lock = optional(object({<br/>      name  = optional(string)<br/>      level = optional(string)<br/>      notes = optional(string)<br/>    }))<br/>  }))</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | tags to be added to the subscription(s) | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_management_group"></a> [management\_group](#output\_management\_group) | management group details |
| <a name="output_management_group_subscription_associations"></a> [management\_group\_subscription\_associations](#output\_management\_group\_subscription\_associations) | management group subscription associations |
| <a name="output_subscriptions"></a> [subscriptions](#output\_subscriptions) | subscription(s) details |
<!-- END_TF_DOCS -->

## Testing

For more information, please see our testing [guidelines](./TESTING.md)

## Notes

Using a dedicated module, we've developed a naming convention for resources that's based on specific regular expressions for each type, ensuring correct abbreviations and offering flexibility with multiple prefixes and suffixes.

Full examples detailing all usages, along with integrations with dependency modules, are located in the examples directory.

To update the module's documentation run `make doc`

## Authors

Module is maintained by [these awesome contributors](https://github.com/cloudnationhq/terraform-azure-sa/graphs/contributors).

## Contributing

We welcome contributions from the community! Whether it's reporting a bug, suggesting a new feature, or submitting a pull request, your input is highly valued.

For more information, please see our contribution [guidelines](./CONTRIBUTING.md).

## License

MIT Licensed. See [LICENSE](https://github.com/cloudnationhq/terraform-azure-sub/blob/main/LICENSE) for full details.

## References

- [Documentation](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/resource-org-subscriptions)
- [Rest Api](https://learn.microsoft.com/en-us/rest/api/subscription)
- [Rest Api Specs](https://github.com/Azure/azure-rest-api-specs/tree/1f449b5a17448f05ce1cd914f8ed75a0b568d130/specification/subscription/resource-manager)
