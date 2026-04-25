#!/bin/bash

# 1. Verificación de permisos
if [ "$EUID" -ne 0 ]; then 
  echo "Por favor, ejecuta como root o usando sudo."
  exit
fi

echo "--- 1. Instalando Dependencias ---"
apt-get update
apt-get install -y apache2 mariadb-server mariadb-client wget unzip
apt-get install -y php php-cli php-curl php-common php-intl php-gd \
php-mbstring php-mysql php-soap php-xml php-zip php-imap php-ldap

echo "--- 2. Configurando Apache y PHP ---"
a2enmod rewrite
PHP_INI=$(php -i | grep /.+/php.ini | head -1 | cut -d" " -f5)
if [ -f "$PHP_INI" ]; then
    sed -i "s/^error_reporting = .*/error_reporting = E_ALL \& ~E_DEPRECATED \& ~E_STRICT \& ~E_NOTICE \& ~E_WARNING/" "$PHP_INI"
fi

echo "--- 3. Descarga y Extracción de SuiteCRM 8.9.3 ---"
URL="[https://suitecrm.com/download/166/suite89/567686/suitecrm-8-9-3.zip](https://suitecrm.com/download/166/suite89/567686/suitecrm-8-9-3.zip)"
DIR="/var/www/html/suitecrm"
mkdir -p $DIR
cd /tmp
wget $URL -O suitecrm.zip
unzip -q suitecrm.zip -d $DIR

echo "--- 4. Aplicando Permisos Críticos ---"
cd $DIR
chown -R www-data:www-data .
chmod -R 755 .
chmod -R 775 cache custom modules themes data upload config_override.php

echo "--- 5. Reiniciando Servicios ---"
systemctl restart apache2
systemctl restart mysql

echo "--- PROCESO DE SCRIPT COMPLETADO ---"
