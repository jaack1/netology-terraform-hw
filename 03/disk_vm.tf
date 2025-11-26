resource "yandex_compute_disk" "storage-disks" {
  count = 3
  name       = "task-03-storage-disk-${count.index}"
  type       = "network-hdd"
  size       = 1
}


resource "yandex_compute_instance" "storage" {
  depends_on = [ yandex_compute_disk.storage-disks ]
  name        = "task-03-storage"
  platform_id = "${var.vm_web_platform_id}"
  resources {    
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
    }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage-disks
    content {
      disk_id   = yandex_compute_disk.storage-disks[secondary_disk.key].id
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
  metadata = var.metadata
}
