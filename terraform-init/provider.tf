provider "google" {
  project = "revanth-gcp-2020"
  region  = "us-central1"
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.76"
    }
  }
}