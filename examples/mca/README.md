# Default

This example illustrates how to create a MCA subscription, a subscription with a Microsoft Customer Agreement.

## Notes

A billing account with billing profile and invoice section is required. In order to create the subscription, the user running Terraform needs
'Azure Subscription Creator' or one of the billing (profile) roles, see also: https://learn.microsoft.com/en-us/azure/cost-management-billing/manage/understand-mca-roles#subscription-billing-roles-and-tasks

Even though the properties are called billing account name, billing profile name and invoice section name in Terraform, in the portal this is called the billing profile ID, billling account ID and invoice section ID.
