# Static IP address for LB
resource "google_compute_global_address" "default" {
  name     = "${var.project_id}-static-ip"
}

resource "google_compute_forwarding_rule" "compute" {
  name                  = "${var.mig_name}-compute-instance-group"
  #target                = google_compute_target_pool.compute.self_link
  load_balancing_scheme = "${var.lb_scheme}"
  port_range            = "80"
  target                = google_compute_target_http_proxy.default.id
  ip_address            = google_compute_global_address.default.id
}

# http proxy
resource "google_compute_target_http_proxy" "default" {
  name     = "${var.project_id}-http-proxy"
  url_map  = google_compute_url_map.default.id
}

# url map
resource "google_compute_url_map" "default" {
  name            = "${var.project_id}-url-map"
  default_service = google_compute_backend_service.default.id
}

# backend service 
resource "google_compute_backend_service" "default" {
  name                    = "${var.project_id}-backend-service"
  provider                = google-beta
  protocol                = "HTTP"
  port_name               = "my-port"
  load_balancing_scheme   = "${var.lb_scheme}"
  timeout_sec             = 10
  enable_cdn              = true
  health_checks           = [google_compute_http_health_check.compute.id]
  backend {
    group           = "${google_compute_instance_group_manager.compute.instance_group}"
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
  }
}