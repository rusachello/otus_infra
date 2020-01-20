output "app_external_ip" {
  value = module.app.app_external_ip
}

#output "reddit_app_load_balancer_external_ip" {
#  value = google_compute_forwarding_rule.reddit-app-http-forwarding.ip_address
#}
#
#output "reddit_app_load_balancer_port_range" {
#  value = google_compute_forwarding_rule.reddit-app-http-forwarding.port_range
#}
