module "backend-app" {
  source    = "./modules"
  mig_name  = "backend-mig-group"
  region    = "us-central1"
  zone      = "us-central1-a"
  lb_scheme = "INTERNAL_SELF_MANAGED"
}