output "reddit-app0_external_ip" {
  value = google_compute_instance.reddit-app[0].network_interface[0].access_config[0].nat_ip
}

output "reddit-app1_external_ip" {
  value = google_compute_instance.reddit-app[1].network_interface[0].access_config[0].nat_ip
}

output "reddit_app_load_balancer_external_ip" {
  value = google_compute_forwarding_rule.reddit-app-http-forwarding.ip_address
}

output "reddit_app_load_balancer_port_range" {
  value = google_compute_forwarding_rule.reddit-app-http-forwarding.port_range
}
