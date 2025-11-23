###cloud vars

variable "project_name" {
  type        = string
  default     = "netology-develop-platform"
  description = "VM name prefix"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "vm_os_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "OS Family"
}

variable "test" {
  type        = map(list(string))
  default = {
    dev1 = [  "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117", "10.0.1.7" ]
    dev2 = [ "ssh -o 'StrictHostKeyChecking=no' ubuntu@84.252.140.88", "10.0.2.29" ]
    prod1 = [ "ssh -o 'StrictHostKeyChecking=no' ubuntu@51.250.2.101", "10.0.1.30" ]
  }
}
