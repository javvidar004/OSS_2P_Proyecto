# Guía de Instalación de SuiteCRM 8.9.3

Este documento explica cómo utilizar el script de automatización para preparar un servidor basado en Ubuntu/Debian, instalar SuiteCRM 8.9.3 y las consideraciones críticas que se deben tomar para garantizar la estabilidad del sistema.

## 1. ¿Qué hace el script?

El script automatiza las tareas más propensas a errores humanos durante la instalación:

Gestión de Dependencias (Stack LAMP):

Instala el servidor web Apache.

Instala el motor de base de datos MariaDB.

Configura PHP con todos los módulos requeridos por la guía oficial (intl, gd, zip, mbstring, soap, imap, etc.).

Configuración de Entorno:

Habilita mod_rewrite en Apache (indispensable para la API de SuiteCRM 8).

Modifica el archivo php.ini para ajustar el error_reporting, evitando que avisos de PHP bloqueen la ejecución de la aplicación.

Descarga y Extracción:

Obtiene el paquete oficial de SuiteCRM 8.9.3 desde la URL especificada.

Extrae los archivos en /var/www/html/suitecrm.

Permisos de Archivos (Clave del Éxito):

Cambia el propietario a www-data (usuario por defecto de Apache).

Establece permisos 755 generales.

Establece permisos 775 específicos en carpetas de escritura dinámica (cache, custom, modules, themes, data, upload), tal como indica la guía de descarga adjunta.

## 2. El Script de Instalación

Crea un archivo llamado instalar.sh, pega el siguiente código y ejecútalo con sudo bash instalar.sh.

´´´
#!/bin/bash

1. Verificación de permisos
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
´´´

## 3. Consideraciones Adicionales (Puntos Críticos)

Para completar la instalación con éxito, el administrador debe realizar las siguientes tareas manuales:

A. Configuración del VirtualHost (Vital para SuiteCRM 8)

A diferencia de SuiteCRM 7, la versión 8 requiere que el servidor apunte a la subcarpeta /public.
Debes editar tu archivo de configuración de Apache (ej. /etc/apache2/sites-available/000-default.conf) para que se vea así:

DocumentRoot /var/www/html/suitecrm/public

<Directory /var/www/html/suitecrm/public>
    Options Indexes FollowSymLinks MultiViews
    AllowOverride All
    Order allow,deny
    allow from all
</Directory>


Si no haces esto, recibirás errores 404 al intentar usar el CRM.

B. Creación de la Base de Datos

Antes de abrir el instalador web, crea la base de datos:

CREATE DATABASE suitecrm_db;
CREATE USER 'suite_user'@'localhost' IDENTIFIED BY 'tu_password_seguro';
GRANT ALL PRIVILEGES ON suitecrm_db.* TO 'suite_user'@'localhost';
FLUSH PRIVILEGES;


C. El Cron de SuiteCRM

SuiteCRM no puede enviar correos ni ejecutar flujos de trabajo sin el Cron. Agrega la siguiente línea ejecutando crontab -e -u www-data:

* * * * * cd /var/www/html/suitecrm; php -f cron.php > /dev/null 2>&1


D. Límites de Memoria PHP

Se recomienda editar el archivo php.ini para aumentar el límite de memoria, ya que SuiteCRM es una aplicación robusta:

memory_limit = 256M

upload_max_filesize = 20M

max_execution_time = 300

Nota: Esta guía fue generada basándose en el manual de instalación de SuiteCRM 8 y la guía de permisos adjunta.
