output "app_external_ip" {
  value = google_compute_instance.app.network_interface.0.access_config.0.nat_ip
  description = "This is external ip address of app"
}

output "app_internal_ip" {
  value = google_compute_instance.app.network_interface.0.network_ip
}
