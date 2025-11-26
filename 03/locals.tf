locals {
  ssh_key_file = file("~/.ssh/id_ed25519")

  # Список всех ресурсов инстансов
  instances = {
    "webservers" = yandex_compute_instance.web
    "databases" = yandex_compute_instance.database
    "storages" = yandex_compute_instance.storage
  }  
}
