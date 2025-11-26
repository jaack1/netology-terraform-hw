
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

variable "each_vm" {
  type = map(object({  vm_name=string, cpu=number, ram=number, core_fraction=number, disk_volume=number }))
  default = { 
    "main" = {
      vm_name = "main"
      cpu = 2
      ram = 4
      core_fraction = 20
      disk_volume = 1
    },
    "replica" = {
      vm_name = "replica"
      cpu = 2
      ram = 2
      core_fraction = 20
      disk_volume = 2
    }
  }
}

variable "metadata" {
  description = "Object of vms metadata"
  type        = object({
                  serial-port-enable = number
  })
  default     = {
    serial-port-enable=1
  }
}

