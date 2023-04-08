terraform {
  required_providers {
    google = "~>4.60.0"
  }
}

provider "google-beta" {
  project = "amit-project"
  region  = "us-central1"
}

provider "google" {
  project = "amit-project"
  region  = "us-central1"
}
