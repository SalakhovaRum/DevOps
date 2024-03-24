```
Задание: 
написать playbook который должен будет:
Создать пользователя на удаленной машине
Сделать авторизацию ssh по ключам для пользователя
Отключить авторизацию по паролю на сервере
Создать директорию в /opt/ с правами для пользователя.
```

Я все выполняла на виртуальной машине Ubuntu

Для начала установила Ansible c помощью команды sudo apt install ansible

***Отредактировала файл '/etc/ansible/hosts'***

![img.png](img.png)

***Создала файл с расширением 'devops_homework.yaml', написала туда следующий playbook***
![img_1.png](img_1.png)![img_10.png](img_10.png)![img_11.png](img_11.png)


```Запуск Playbook```

С помощью команды **ansible-playbook devops_homework.yml**

Правда 1 раз, когда запустила вышла эта картинка:

![img_4.png](img_4.png)

А при запуске 2 раз, уже по другому 
![img_8.png](img_8.png)


```Проверка```

![img_5.png](img_5.png)
![img_6.png](img_6.png)
![img_7.png](img_7.png)
![img_9.png](img_9.png)