locals {
  json_data = jsondecode(file("service_accounts.auto.tfvars.json"))
}

resource "google_project_iam_binding" "project" {
  for_each = { for index,service_account in local.json_data.service_accounts : index => service_account }
  project = var.project
  role    = each.value.role

  members = [
    "serviceAccount:${each.value.account_id}@${var.project}.iam.gserviceaccount.com"
  ]
}

variable "project" {
  default = "revanth-gcp-2020"
}
