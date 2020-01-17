# Create Target Pool of instances used as target of a network load balancer
resource "google_compute_target_pool" "reddit-app-group" {
  name      = "reddit-app-group"
  instances = google_compute_instance.reddit-app.*.self_link
  health_checks = [
    google_compute_http_health_check.default.name,
  ]
}

# Create an HTTP legacy health check to monitor load balanced instances
resource "google_compute_http_health_check" "default" {
  name               = "lb-health-check9292"
  request_path       = "/"
  check_interval_sec = 5
  timeout_sec        = 5
  port               = 9292
}

# Create forwarding rule for Load Balancing
resource "google_compute_forwarding_rule" "reddit-app-http-forwarding" {
  name = "reddit-app-http-forwarding"
  description           = "forwarding rule for reddit application"
  target                = google_compute_target_pool.reddit-app-group.self_link
  port_range            = "9292"
  load_balancing_scheme = "EXTERNAL"
}
