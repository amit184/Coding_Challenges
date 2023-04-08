variable "project_id" {
  default     = "amit-project"
  type        = string
  description = "project ID"
}

variable bk_region {
  description = "Region for managed instance group"
  default = "us-central1"
}

variable bk_zone1 {
  description = "Zone for managed instance groups"
  default = "us-central1-a"
}

variable bk_zone2 {
  description = "Zone for managed instance groups"
  default = "us-central1-b"
}

variable fr_region {
  description = "Region for managed instance group"
  default = "us-east4"
}

variable fr_zone1 {
  description = "Zone for managed instance groups"
  default = "us-east4-a"
}

variable fr_zone2 {
  description = "Zone for managed instance groups"
  default = "us-east4-b"
}

variable bk_mig_name {
  description = "Name of the managed instance group"
  default = "bk-mig-group"
}

variable fr_mig_name {
  description = "Name of the managed instance group"
  default = "bk-mig-group"
}

variable mig_size {
  description = "Target size of the manged instance group"
  default = 2
}

# variable subnetwork_name {
#   description = "Name of the subnetwork to deploy instances to"
#   default = "default"
# }

variable compute_machine_type {
  description = "Machine type for the VMs in the instance group"
  default = "n1-standard-1"
}

variable compute_image {
  description = "Image used for compute VMs"
  default = "ubuntu-1604-xenial-v20170328"
}

variable service_port {
  description = "TCP port your service is listening on."
  default = "80"
}

output "external_ip" {
  value = "${google_compute_forwarding_rule.compute.ip_address}"
}
