FROM php:8.2-fpm

# Устанавливаем системные пакеты для Laravel и Composer
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    libzip-dev \
    libxml2-dev \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libicu-dev \
    libpq-dev \
    nano \
    && docker-php-ext-install zip pdo pdo_mysql mysqli gd intl \
    && docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Устанавливаем Xdebug
RUN pecl channel-update pecl.php.net \
    && pecl install xdebug-3.2.2 \
    && docker-php-ext-enable xdebug \
    && echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.start_with_request=trigger" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_port=9003" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# Рабочая директория
WORKDIR /var/www/html

# Копируем entrypoint
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
