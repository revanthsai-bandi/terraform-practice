resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = "tf_dataset"
  description                 = "This is a test description"
  location                    = "asia-south1"

  labels = {
    env = "default"
  }

    dynamic "access" {
    for_each = local.bq_ds_views.views
        content {
            view {
                dataset_id = access.value.dataset_id
                project_id = access.value.project_id
                table_id   = access.value.table_id 
            }     
        }
    }

    dynamic "access" {
    for_each = local.bq_ds_roles.roles
        content {
            role = access.value.role
            user_by_email = access.value.user_by_email
        }
    }

}

locals {
  bq_ds_views = jsondecode(file("dataset_views_access.auto.tfvars.json"))
}

locals{
    bq_ds_roles = jsondecode(file("dataset_role_access.auto.tfvars.json"))
}