#!/bin/bash

# Esperar a que MySQL esté disponible
until mysql -h"$WORDPRESS_DB_HOST" -u"$WORDPRESS_DB_USER" -p"$WORDPRESS_DB_PASSWORD" -e ""; do
    >&2 echo "MySQL is unavailable - sleeping"
    sleep 1
done

# Crear wp-config.php a partir de wp-config-sample.php si no existe
if [ ! -f /var/www/html/wp-config.php ]; then
    cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

    # Configurar wp-config.php con las variables de entorno
    sed -i "s/db/$WORDPRESS_DB_NAME/" /var/www/html/wp-config.php
    sed -i "s/dkadm/$WORDPRESS_DB_USER/" /var/www/html/wp-config.php
    sed -i "s/adm_wp]/$WORDPRESS_DB_PASSWORD/" /var/www/html/wp-config.php
    sed -i "s/localhost/$WORDPRESS_DB_HOST/" /var/www/html/wp-config.php
fi

# Ejecutar el comando original (WordPress)
exec docker-entrypoint.sh apache2-foreground
