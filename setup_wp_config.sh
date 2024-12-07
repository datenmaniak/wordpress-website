#!/bin/bash

# Cambiar a la ruta donde se encuentra wp-config.php
WP_CONFIG_PATH="/var/www/html/wp-config.php"

# Actualizar las variables en wp-config.php usando sed
sed -i "s/define('DB_NAME', '.*');/define('DB_NAME', '${WORDPRESS_DB_NAME}');/" $WP_CONFIG_PATH
sed -i "s/define('DB_USER', '.*');/define('DB_USER', '${WORDPRESS_DB_USER}');/" $WP_CONFIG_PATH
sed -i "s/define('DB_PASSWORD', '.*');/define('DB_PASSWORD', '${WORDPRESS_DB_PASSWORD}');/" $WP_CONFIG_PATH
sed -i "s/define('DB_HOST', '.*');/define('DB_HOST', '${WORDPRESS_DB_HOST}');/" $WP_CONFIG_PATH

# Puedes agregar más configuraciones si es necesario