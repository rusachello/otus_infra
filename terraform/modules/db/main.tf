
resource "google_compute_instance" "reddit-db" {
  name         = "reddit-db"
  machine_type = "g1-small"
  tags         = ["reddit-db"]
  metadata = {
    # добавление ssh-ключей в метаданные инстанса для нескольких пользователей
    ssh-keys = "user0:${file(var.public_key_path)}\nuser1:${file(var.public_key_path)}"
  }


  boot_disk {
    initialize_params { image = var.db_disk_image }
  }

  network_interface {
    network = "default"
    access_config {}
  }

}

resource "google_compute_firewall" "firewall_mongo" {
  name = "allow-mongo-default"
  # Название сети, в которой действует правило
  network = "default"
  # Какой доступ разрешить
  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }
  # Каким адресам разрешаем доступ
  source_tags = ["reddit-app"]
  # Правило применимо для инстансов с перечисленными тэгами
  target_tags = ["reddit-db"]
}
