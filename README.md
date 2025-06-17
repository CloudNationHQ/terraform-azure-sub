# Subscription

This terraform module simplifies the process of creating and managing subscriptions on azure with customizable options and features, offering a flexible and powerful solution for managing azure subscriptions through code.

## Features

Offers support for the creation of MCA subscriptions and enrollment (EA) subscriptions.

Provides support for creatin gmultiple subscriptions at once.

Implements optional management locks for enhanced security.

<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (~> 4.0)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (~> 4.0)

## Resources

The following resources are used by this module:

- [azurerm_management_group_subscription_association.sub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group_subscription_association) (resource)
- [azurerm_management_lock.lock](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock) (resource)
- [azurerm_subscription.sub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subscription) (resource)
- [azurerm_billing_enrollment_account_scope.enrollment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/billing_enrollment_account_scope) (data source)
- [azurerm_billing_mca_account_scope.mca](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/billing_mca_account_scope) (data source)
- [azurerm_billing_mpa_account_scope.mpa](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/billing_mpa_account_scope) (data source)
- [azurerm_management_group.group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/management_group) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_subscription"></a> [subscription](#input\_subscription)

Description: subscription details

Type:

```hcl
object({
    name                          = optional(string)
    alias                         = optional(string, null)
    billing_scope_id              = optional(string)
    subscription_id               = optional(string, null)
    workload                      = optional(string, "Production")
    tags                          = optional(map(string))
    management_group_name         = optional(string)
    management_group_display_name = optional(string)
    management_lock = optional(object({
      name  = optional(string)
      level = optional(string, "CanNotDelete")
      notes = optional(string, null)
    }))
  })
```

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_billing_enrollment_account"></a> [billing\_enrollment\_account](#input\_billing\_enrollment\_account)

Description: billing enrollment account details

Type:

```hcl
object({
    billing_account_name    = string
    enrollment_account_name = string
  })
```

Default: `null`

### <a name="input_billing_mca_account"></a> [billing\_mca\_account](#input\_billing\_mca\_account)

Description: billing mca account details

Type:

```hcl
object({
    billing_account_name = string
    billing_profile_name = string
    invoice_section_name = string
  })
```

Default: `null`

### <a name="input_billing_mpa_account"></a> [billing\_mpa\_account](#input\_billing\_mpa\_account)

Description: billing mpa account details

Type:

```hcl
object({
    billing_account_name = string
    customer_name        = string
  })
```

Default: `null`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: tags to be added to the subscription(s)

Type: `map(string)`

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_management_group"></a> [management\_group](#output\_management\_group)

Description: management group details

### <a name="output_management_group_subscription_associations"></a> [management\_group\_subscription\_associations](#output\_management\_group\_subscription\_associations)

Description: management group subscription associations

### <a name="output_subscriptions"></a> [subscriptions](#output\_subscriptions)

Description: subscription(s) details
<!-- END_TF_DOCS -->

## Goals

For more information, please see our [goals and non-goals](./GOALS.md).

## Testing

For more information, please see our testing [guidelines](./TESTING.md)

## Notes

Using a dedicated module, we've developed a naming convention for resources that's based on specific regular expressions for each type, ensuring correct abbreviations and offering flexibility with multiple prefixes and suffixes.

Full examples detailing all usages, along with integrations with dependency modules, are located in the examples directory.

To update the module's documentation run `make doc`

## Contributors

We welcome contributions from the community! Whether it's reporting a bug, suggesting a new feature, or submitting a pull request, your input is highly valued.

For more information, please see our contribution [guidelines](./CONTRIBUTING.md). <br><br>

<a href="https://github.com/cloudnationhq/terraform-azure-sub/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=cloudnationhq/terraform-azure-sub" />
</a>

## License

MIT Licensed. See [LICENSE](https://github.com/cloudnationhq/terraform-azure-sub/blob/main/LICENSE) for full details.

## References

- [Documentation](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/resource-org-subscriptions)
- [Rest Api](https://learn.microsoft.com/en-us/rest/api/subscription)
- [Rest Api Specs](https://github.com/Azure/azure-rest-api-specs/tree/1f449b5a17448f05ce1cd914f8ed75a0b568d130/specification/subscription/resource-manager)
