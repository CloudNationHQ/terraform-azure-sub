module "sub" {
  source  = "cloudnationhq/sub/azure"
  version = "~> 2.0"

  for_each = {
    for key, subscription in local.subscriptions : key => subscription
  }

  subscription        = each.value
  billing_mca_account = local.billing_mca_account
}
