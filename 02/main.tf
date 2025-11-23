resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
  route_table_id = yandex_vpc_route_table.develop.id
}

resource "yandex_vpc_gateway" "develop" {
  name = var.vpc_name
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "develop" {
  name       = var.vpc_name
  network_id = yandex_vpc_network.develop.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.develop.id
  }
}

data "yandex_compute_image" "ubuntu" {
  family = "${var.vm_os_family}"
}

# netology-develop-platform-web ---------------------------------------------------------------

resource "yandex_compute_instance" "platform-web" {
  name        = local.name_web
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
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = false
  }
  metadata = var.metadata
}

# netology-develop-platform-db ----------------------------------------------------------------

resource "yandex_compute_instance" "platform-db" {
  name        = local.name_db
  platform_id = "${var.vm_db_platform_id}"
  resources {    
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
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
    nat       = false
  }
  metadata = var.metadata
}