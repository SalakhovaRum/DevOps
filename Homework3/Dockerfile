# Используем официальный образ Ubuntu 20.04
FROM ubuntu:20.04

# Метаданные о создателе образа
MAINTAINER Салахова Румия <littleangel03@mail.ru>

# Обновляем пакеты и устанавливаем необходимые зависимости
RUN apt-get update && apt-get install -y \
    apache2 \
    mysql-server \
    postgresql \
    && rm -rf /var/lib/apt/lists/*

# Команда CMD для запуска сервисов
CMD ["apache2ctl", "-D", "FOREGROUND"]

# Устанавливаем рабочую директорию
WORKDIR /var/www/html

# Устанавливаем переменные среды
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

# Копируем конфигурационные файлы в контейнер
COPY apache2.conf /etc/apache2/apache2.conf
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

# Добавляем тестовую страницу
ADD index.html /var/www/html/

# Открываем порты
EXPOSE 80

# Создаем volume для данных базы данных
VOLUME /var/lib/mysql
VOLUME /var/lib/postgresql

# Задаем пользователя для контейнера
USER www-data
