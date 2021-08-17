terraform {
  backend "gcs" {
    bucket = "terraform_remote_backend001"
    prefix = "terraform/dynamic-blocks"
  }
}
