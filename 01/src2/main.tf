terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
  required_version = ">=1.12.0" /*Многострочный комментарий.
 Требуемая версия terraform */
}
provider "docker" {
  host     = "ssh://jack@10.129.0.36:22"
  ssh_opts = ["-o", "StrictHostKeyChecking=no"]
}

#однострочный комментарий

resource "random_password" "root" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "random_password" "user" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "docker_image" "mysql" {
  name         = "mysql:8"
  keep_locally = true
}

resource "docker_container" "mysql" {
  image = docker_image.mysql.image_id
  name  = "mysql-from-task1-2"
  env   = [
        "MYSQL_ROOT_PASSWORD=${random_password.root.result}",
        "MYSQL_DATABASE=wordpress",
        "MYSQL_USER=wordpress",
        "MYSQL_PASSWORD=${random_password.user.result}",
        "MYSQL_ROOT_HOST=343",
  ]

  ports {
    internal = 3306
    external = 3306
  }
}
