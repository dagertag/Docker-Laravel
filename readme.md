# 🚀 Установка Laravel через Docker Compose

Инструкция по быстрому запуску Laravel-проекта через Docker.

---

## 🟢 Шаг 1. Клонируем проект

Создайте любую папку и откройте её в IDE.  
В командной строке выполните:

```bash
git clone https://github.com/dagertag/Docker-Laravel.git
cd Docker-Laravel
```

---

## 🛠️ Шаг 2. Запуск сборки

Запускаем сборку контейнеров:

```bash
docker compose up --build -d
```

Ждём завершения загрузки образов и запуска контейнеров.

---

## ✅ Шаг 3. Проверка успешного запуска

В терминале должно появиться примерно:

```
[+] Running 7/7
✔ prog-php                     Built
✔ Network prog_default         Created
✔ Volume prog_db_data          Created
✔ Container prog-mysql-1       Started
✔ Container prog-phpmyadmin-1  Started
✔ Container prog-php-1         Started
✔ Container prog-nginx-1       Started
```

Не спешите открывать сайт — автоматически выполняется установка Laravel и настройка прав доступа.

---

## 📋 Шаг 4. Контроль установки Laravel

Открываем логи для контроля:

```bash
docker compose logs -f
```

Когда увидите:

```
php-1 | INFO  Running migrations.
php-1 |   0001_01_01_000000_create_users_table ......................... DONE
php-1 |   0001_01_01_000001_create_cache_table .......................... DONE
php-1 |   0001_01_01_000002_create_jobs_table .......................... DONE
```

— установка завершена. Нажмите `Ctrl + C` и откройте файл `Laravel/.env`.

---

## ⚙️ Шаг 5. Настройка `.env`

Найдите блок:

```dotenv
DB_CONNECTION=sqlite
# DB_HOST=127.0.0.1
# DB_PORT=3306
# DB_DATABASE=laravel
# DB_USERNAME=root
# DB_PASSWORD=
```

и замените его на:

```dotenv
DB_CONNECTION=mysql
DB_HOST=docker-laravel-mysql-1
DB_PORT=3306
DB_DATABASE=mydb
DB_USERNAME=root
DB_PASSWORD=root
```

---

## 🏃 Шаг 6. Выполнение миграций

Войдите в контейнер PHP:

```bash
docker exec -it docker-laravel-php-1 bash
```

и выполните команду:

```bash
php artisan migrate
```

Вы должны увидеть:

```
INFO  Running migrations.
0001_01_01_000000_create_users_table .................. DONE
0001_01_01_000001_create_cache_table .................. DONE
0001_01_01_000002_create_jobs_table ................... DONE
```

---

## 🌐 Шаг 7. Тестирование

Проверьте сайт:

[http://localhost:8080/](http://localhost:8080/)

PhpMyAdmin доступен по адресу:

[http://localhost:8081/](http://localhost:8081/)

---

## 💻 Шаг 8. Подключение к БД через PHPStorm

Настройки подключения:

```
Host: localhost
Port: 3306
User: user
Password: password
Database: mydb
```

---

© 2025 Инструкция по установке Laravel через Docker

