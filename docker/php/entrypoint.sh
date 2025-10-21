#!/bin/bash
set -e

# Если Laravel еще не скачан
if [ ! -f /var/www/html/artisan ]; then
    echo ">>> Скачиваем Laravel..."
    composer create-project laravel/laravel . --prefer-dist
fi

# Исправляем владельца для критически важных директорий
# Это передает владение www-data, под которым работает PHP-FPM
chown -R www-data:www-data /var/www/html/storage
chown -R www-data:www-data /var/www/html/bootstrap/cache

# Устанавливаем права на запись (775 для папок, 664 для файлов)
# -R 775 для папок: www-data может читать, писать, выполнять
chmod -R 775 /var/www/html/storage
chmod -R 775 /var/www/html/bootstrap/cache
# Запускаем PHP-FPM
php-fpm
