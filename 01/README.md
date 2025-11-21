Задание 1
1-1
![Image alt](https://github.com/jaack1/netology-terraform-hw/blob/main/01/screenshots/img1-1.png)

1-2 Согласно gitignore секреты можно сохранить в файле personal.auto.tfvars

1-3 "result": "8iysjUyROYIz71NO"

1-4

В первой ошибке говорится о том, что у ресурса должно быть минимум два лейбла. Первый - тип, а второй - название.
Вторая ошибка говорит о том, что лейбл не может начинаться с цыфры.
![Image alt](https://github.com/jaack1/netology-terraform-hw/blob/main/01/screenshots/img1-4-0.png)

Третья ошибка из-за того, что неверно написано имя ресурса для генерации строки (_FAKE и resulT)
![Image alt](https://github.com/jaack1/netology-terraform-hw/blob/main/01/screenshots/img1-4-1.png)

1-5

![Image alt](https://github.com/jaack1/netology-terraform-hw/blob/main/01/screenshots/img1-5.png)

1-6
флаг -auto-approve выполнит команду без запроса ручного подтверждения. Опасность в том, что случайное выполнение такой команды, может привести к несанкционированной перенастройке инфраструктуры. Предполагаю, что может пригодится в случае автоматизации, например, когда terraform apply вызывается при выполнении каких-нибудь скриптов настройки.

![Image alt](https://github.com/jaack1/netology-terraform-hw/blob/main/01/screenshots/img1-6.png)

1-7

![Image alt](https://github.com/jaack1/netology-terraform-hw/blob/main/01/screenshots/img1-7.png)

Содержимое файла terraform.tfstate после уничтожения ресурсов
{
  "version": 4,
  "terraform_version": "1.13.5",
  "serial": 35,
  "lineage": "e94d666d-2cbe-c637-f290-c895c7ed96b8",
  "outputs": {},
  "resources": [],
  "check_results": null
}

1-8 

Образ не был удалён т.к. в ресурсе docker_image вписан атрибут keep_locally = true
Ссылка на документацию:
https://docs.comcloud.xyz/providers/kreuzwerker/docker/latest/docs/resources/image#keep_locally-1

2-0

Код по задаче 2

https://github.com/jaack1/netology-terraform-hw/tree/main/01/src2

![Image alt](https://github.com/jaack1/netology-terraform-hw/blob/main/01/screenshots/img2-0.png)

3-0

Код по задаче 3

https://github.com/jaack1/netology-terraform-hw/tree/main/01/src3
