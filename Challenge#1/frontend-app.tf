module "frontend-app" {
  source   = "./modules"
  mig_name = "frontend-mig-group"
  region   = "us-east4"
  zone     = "us-east4-a"

}