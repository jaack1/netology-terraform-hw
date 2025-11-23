
variable "vms_resources" {
  description = "Map of vms resources"
  type        = map(object({
                      cores = number
                      memory = number
                      core_fraction = number
  }))
  default     = {
    web={
        cores=2
        memory=2
        core_fraction=20
    },
    db= {
        cores=2
        memory=2
        core_fraction=20
    }
  }
}

variable "metadata" {
  description = "Object of vms metadata"
  type        = object({
                  serial-port-enable = number
                  ssh-keys = string
                  enable-oslogin = string
  })
  default     = {
    serial-port-enable=1
    ssh-keys="ubuntu:ssh-ed25519 AAAAC3..."
  }
}

# netology-develop-platform-web ---------------------------------------------------------------

variable "vm_web_platform_name" {
  type        = string
  default     = "web"
  description = "Platform name"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Platform id"
}


# netology-develop-platform-db ----------------------------------------------------------------

variable "vm_db_platform_name" {
  type        = string
  default     = "db"
  description = "Platform name"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Platform id"
}

