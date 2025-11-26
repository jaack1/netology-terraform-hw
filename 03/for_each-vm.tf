resource "yandex_compute_instance" "database" {
  for_each = var.each_vm
  name = "task-03-db-${each.key}"
  zone = var.default_zone
  platform_id = "${var.vm_web_platform_id}"
  resources {    
    cores = each.value.cpu
    memory = each.value.ram
    core_fraction = each.value.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
    nat       = true
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = self.network_interface.0.nat_ip_address
    private_key = local.ssh_key_file
    timeout     = "120s"
  }
}
