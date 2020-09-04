#!/bin/sh
PHP=magento_php_1
docker exec -it ${PHP} php /var/www/html/bin/magento $@
