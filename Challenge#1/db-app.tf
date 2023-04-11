resource "google_redis_instance" "main" {
  authorized_network      = google_compute_network.vpc-main.name
  connect_mode            = "DIRECT_PEERING"
  location_id             = "southeast-asia1-a"
  memory_size_gb          = 1
  name                    = "${var.project_id}-cache"
  display_name            = "${var.project_id}-cache"
  project                 = var.project_id
  redis_version           = "REDIS_6_X"
  region                  = "southeast-asia1"
  tier                    = "BASIC"
  transit_encryption_mode = "DISABLED"
}

resource "random_id" "id" {
  byte_length = 2
}

resource "google_sql_database_instance" "main" {
  name             = "${var.project_id}-db-${random_id.id.hex}"
  database_version = "POSTGRES_14"
  region           = "southeast-asia1"
  project          = var.project_id

  settings {
    tier                  = "db-g1-small"
    disk_autoresize       = true
    disk_autoresize_limit = 0
    disk_size             = 10
    disk_type             = "PD_SSD"
    ip_configuration {
      ipv4_enabled    = false
      private_network = "projects/${var.project_id}/global/networks/${google_compute_network.vpc-main.name}"
    }
    location_preference {
      zone = "southeast-asia1-a"
    }
    database_flags {
      name  = "cloudsql.iam_authentication"
      value = "on"
    }
  }
  deletion_protection = false

}

resource "google_sql_user" "main" {
  project  = var.project_id
  name     = "${google_service_account.runsa.account_id}@${var.project_id}.iam"
  type     = "CLOUD_IAM_SERVICE_ACCOUNT"
  instance = google_sql_database_instance.main.name
}


resource "google_service_account" "runsa" {
  project      = var.project_id
  account_id   = "${var.project_id}-run-sa"
  display_name = "Service Account for Cloud SQL connection"
}

resource "google_project_iam_member" "allrun" {
  for_each = toset(var.run_roles)
  project  = var.project_id
  role     = each.key
  member   = "serviceAccount:${google_service_account.runsa.email}"
}