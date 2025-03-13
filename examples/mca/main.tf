module "sub" {
  source  = "cloudnationhq/sub/azure"
  version = "~> 1.0"

  subscriptions = {
    demo = {
      name                  = "Subscription-TF-Demo"
      management_group_name = "sandboxes"
    }
    test = {
      name  = "Subscription-TF-Test"
      alias = "test"
    }
  }

  billing_mca_account = {
    billing_account_name = "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX:XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX_XXXX-XX-XX"
    billing_profile_name = "XXXXXXXXXXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
    invoice_section_name = "XXXX-XXXX-XXX-XXX"
  }
}
