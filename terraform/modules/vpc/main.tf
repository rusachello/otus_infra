
# Добавление ssh-ключей в метаданные проекта для нескольких пользователей с сохранением! существующих ssh-ключей 
resource "google_compute_project_metadata_item" "ssh-keys-ry" {
  key   = "sshKeys"
  value = "ry:${file(var.public_key_path)}\nuser2:${file(var.public_key_path)}"
}

resource "google_compute_firewall" "firewall_ssh" {
  name        = "default-allow-ssh"
  network     = "default"
  description = "Allow SSH from everywherrrre"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.source_ranges
}
