FROM ubuntu:20.04

RUN apt update -y; apt install -y curl unzip wget software-properties-common && add-apt-repository ppa:ondrej/php && \
    apt install php5.6-dev -y && apt-get install php5.6-soap -y && \
    apt remove php-cli php-common php-opcache php-phpdbg php-readline php-xml php-pear php-xml php-json -y && \
    apt install apache2 php5.6-soap libapache2-mod-php5.6 php5.6 php5.6-cli php5.6-phpdbg php5.6-readline php5.6-fpm php5.6-opcache php5.6-common php5.6-mssql php5.6-mysql php5.6-zip php5.6-ldap php5.6-gd php5.6-ssh2 php5.6-mbstring php5.6-curl libgmp-dev php5.6-gmp php5.6-xml php5.6-bcmath php5.6-bz2 php5.6-intl php-pear build-essential libaio1 git cron dos2unix -y && \
    a2enmod proxy_fcgi && mkdir /run/php && mkdir -p /var/www/html/cron && chown www-data:root /var/www/html/cron && a2enmod rewrite && \
    apt clean all -y

COPY --chown=www-data:root / /var/www/html/

RUN chown -R www-data:root /var/www/html/

WORKDIR /var/www/html/
CMD php artisan config:cache
