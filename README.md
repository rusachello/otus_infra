#### HW
1. Описана инфраструктура в main.tf
2. Описаны переменные в variables.tf
3. Переменным задано значение через terraform.tfvars
4. Выходные переменные созданы в отдельном файле outputs.tf
5. Все файлы отформатированы командой terraform fmt
6. Создан файл terraform.tfvars.example, *.tfstate, *.tfstate.*.backup, *.tfstate.backup, *.tfvars и .terraform/ добавлены в .gitignore в корне репозитория.

#### Добавление ssh-ключей в метаданные инстанса для нескольких пользователей 

```
resource "google_compute_instance" "app" {
...
  metadata = {
    ssh-keys = "ry:${file(var.public_key_path)} \nuser2:${file(var.public_key_path)}"
    }

также можно использовать следующую констукцию
  
  metadata = {
    ssh-keys = <<EOF
    ry:${file(var.public_key_path)}
    user1:${file(var.public_key_path)}
  EOF
  }
```
  
#### Добавление ssh-ключей в метаданные проекта для нескольких пользователей с сохранением! существующих ssh-ключей во вкладке SSH-ключи. Использование директивы sshKeys (key = "sshKeys") вместо ssh-keys (key = "ssh-keys") в параметре ключа позволяет этого добиться.

```
resource "google_compute_project_metadata_item" "ssh-keys" {
  key = "sshKeys"
  value = "ry:${file(var.public_key_path)} \nuser2:${file(var.public_key_path)}"
}
```
