module "sub" {
  source  = "cloudnationhq/sub/azure"
  version = "~> 1.0"

  subscriptions = {
    demo = {
      name = "TF-demo-subscription"
    }
  }
  billing_enrollment_account = {
    billing_account_name    = "XXX"
    enrollment_account_name = "XXX"
  }
}
