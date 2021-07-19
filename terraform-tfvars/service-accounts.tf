locals {
  json_data_service_accounts = jsondecode(file("service_accounts.auto.tfvars.json"))
}

resource "google_service_account" "service_accounts" {
  for_each = { for index,service_account in local.json_data_service_accounts.service_accounts : index => service_account }
  account_id   = each.value.account_id
  display_name = each.value.display_name
}