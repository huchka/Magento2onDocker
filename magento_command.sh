#!/bin/sh
PHP=magento_php_1
docker exec -it ${PHP} php -d memory_limit=-1 /var/www/html/bin/magento $@
