locals{
    bq_ds_roles = jsondecode(file("dataset_role_access.auto.tfvars.json"))
}

locals{
    list_of_ds = jsondecode(file("datasets.auto.tfvars.json"))
}
# dataset resource

resource "google_bigquery_dataset" "dataset" {
  for_each = toset(local.list_of_ds.datasets)
  dataset_id                  = each.value
  location                    = "asia-south1"
    
  labels = {
    env = "default"
  }

    dynamic "access" {
        for_each = jsondecode(file("${each.value}.auto.tfvars.json")).views
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