resource "google_service_account" "sa1" {
  account_id   = "terraform-deployed-sa1"
  display_name = "Service account deployed by terraform"
}

resource "google_project_iam_binding" "project" {
  project = "revanth-gcp-2020"
  role    = "roles/viewer"

  members = [
    "serviceAccount:${google_service_account.sa1.email}"
  ]
}
