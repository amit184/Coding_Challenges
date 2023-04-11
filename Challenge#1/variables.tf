variable "project_id" {
  default     = "amit-project"
  type        = string
  description = "project ID"
}

variable "service_apis" {
  description = "Services to be enable"
  type = list(string)
  default = [
    "compute.googleapis.com",
    "cloudapis.googleapis.com",
    "vpcaccess.googleapis.com",
    "servicenetworking.googleapis.com",
    "cloudbuild.googleapis.com",
    "sql-component.googleapis.com",
    "sqladmin.googleapis.com",
    "storage.googleapis.com",
    "run.googleapis.com",
    "redis.googleapis.com",
  ]
}

variable "run_roles" {
  description = "roles used by Cloud SQL service"
  type        = list(string)
  default = [
    "roles/cloudsql.instanceUser",
    "roles/cloudsql.client",
  ]
}