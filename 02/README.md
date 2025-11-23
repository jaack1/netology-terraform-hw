Код тут https://github.com/jaack1/netology-terraform-hw/tree/main/02

Задание 1

![Image alt](https://github.com/jaack1/netology-terraform-hw/blob/main/02/screenshots/img1-0.png)

![Image alt](https://github.com/jaack1/netology-terraform-hw/blob/main/02/screenshots/img1-1.png)

1-4

core_fraction=5 нельзя установить значение 5. Только 20, 50, 100.
platform_id = "standart-v4" - есть только v3
Других синтаксических ошибок не нашёл. Ну, разве что наикнул ядер и ОЗУ.

1-6

preemptible = true означает, что ВМ будет спотовой или прерываемой - такие ВМ значительно дешевле, что сокращает расход грантов на обучение.
core_fraction=5 гарантированная доля vCPU чем выше параметр, тем большая доля физического процессора будет отдана виртуальному. На данный момент нельзя установить значение 5. Только 20, 50, 100.



Задание 2

![Image alt](https://github.com/jaack1/netology-terraform-hw/blob/main/02/screenshots/img2-0.png)


Задание 3

![Image alt](https://github.com/jaack1/netology-terraform-hw/blob/main/02/screenshots/img3-0.png)

Задание 4

Outputs:

platform-db = "158.160.75.253"
platform-web = "158.160.84.129"

Задание 5

![Image alt](https://github.com/jaack1/netology-terraform-hw/blob/main/02/screenshots/img5-0.png)

Задание 6

![Image alt](https://github.com/jaack1/netology-terraform-hw/blob/main/02/screenshots/img6-0.png)

![Image alt](https://github.com/jaack1/netology-terraform-hw/blob/main/02/screenshots/img6-1.png)

Задание 7

7-1 local.test_list[1]
7-2 length(local.test_list)
7-3 local.test_map.admin
7-4 "John is ${[for k, v in local.test_map : k if v == "John"][0]} for production server based on OS ${local.servers.production.image} with ${local.servers.production.cpu} vcpu, ${local.servers.production.ram} ram and ${length(local.servers.production.disks)} virtual disks"

Задание 8

variable "test" {
  type        = map(list(string))
  default = {
    dev1 = [  "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117", "10.0.1.7" ]
    dev2 = [ "ssh -o 'StrictHostKeyChecking=no' ubuntu@84.252.140.88", "10.0.2.29" ]
    prod1 = [ "ssh -o 'StrictHostKeyChecking=no' ubuntu@51.250.2.101", "10.0.1.30" ]
  }
}

var.test.dev1[0]

Задание 9

![Image alt](https://github.com/jaack1/netology-terraform-hw/blob/main/02/screenshots/img9-0.png)

![Image alt](https://github.com/jaack1/netology-terraform-hw/blob/main/02/screenshots/img9-1.png)