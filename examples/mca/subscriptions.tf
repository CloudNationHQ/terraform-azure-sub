locals {
  billing_mca_account = {
    billing_account_name = "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX:XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX_XXXX-XX-XX"
    billing_profile_name = "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
    invoice_section_name = "XXXX-XXXX-XXX-XXX"
  }

  subscriptions = {
    demo = {
      name                  = "subscription-tf-demo"
      management_group_name = "sandboxes"
    }
    test = {
      name                  = "subscription-tf-test"
      management_group_name = "test"
      alias                 = "test"
    }
  }
}
