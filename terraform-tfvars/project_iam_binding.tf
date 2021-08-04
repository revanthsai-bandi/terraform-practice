locals {
  json_data_project_roles = jsondecode(file("project_roles.auto.tfvars.json"))
}

resource "google_project_iam_binding" "project" {
  for_each = { for index,role in local.json_data_project_roles : index => role }
  project = var.project
  role    = "roles/${each.key}"

  members = each.value
}

variable "project" {
  default = "revanth-gcp-2020"
}