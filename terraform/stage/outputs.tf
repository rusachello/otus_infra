output "app_external_ip" {
  value = module.app.app_external_ip
  description = "This is external ip address of app"
}

output "db_external_ip" {
  value = module.db.db_external_ip
}

output "app_internal_ip" {
  value = module.app.app_internal_ip
}

output "db_internal_ip" {
  value = module.db.db_internal_ip
}

#output "reddit_app_load_balancer_external_ip" {
#  value = google_compute_forwarding_rule.reddit-app-http-forwarding.ip_address
#}
#
#output "reddit_app_load_balancer_port_range" {
#  value = google_compute_forwarding_rule.reddit-app-http-forwarding.port_range
#}
