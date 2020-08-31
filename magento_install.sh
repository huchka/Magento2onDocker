#!/bin/sh

VARNISH=magento_varnish_1
WEB=magento_web_1
PHP=magento_php_1
ELASTICSEARCH=magento_elasticsearch_1
DATABASE=magento_db_1
REDIS=magento_redis_1

ADMIN_EMAIL='huchka@sbworks.jp'
ADMIN_PASSWORD='Password1234'

# docker-compose run php php /var/www/html/bin/magento setup:install \
docker exec -it ${PHP} php /var/www/html/bin/magento setup:install \
  --db-host ${DATABASE} --db-name magento --db-user root --db-password root  --admin-user admin --timezone 'Asia/Tokyo' --currency JPY --use-rewrites 1 --cleanup-database \
  --backend-frontname admin --admin-firstname AdminFirstName --admin-lastname AdminLastName --admin-email ${ADMIN_EMAIL} --admin-password ${ADMIN_PASSWORD} \
  --base-url 'http://127.0.0.1/' --language en_US \
  --session-save=redis --session-save-redis-host=redis-sessions --session-save-redis-port=6379 --session-save-redis-db=0 --session-save-redis-password='' \
  --cache-backend=redis --cache-backend-redis-server=redis-cache --cache-backend-redis-port=6379 --cache-backend-redis-db=0 \
  --page-cache=redis --page-cache-redis-server=redis-cache --page-cache-redis-port=6379 --page-cache-redis-db=1 \
  --http-cache-hosts=varnish
