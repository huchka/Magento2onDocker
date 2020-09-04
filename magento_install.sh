#!/bin/sh

# 各サービスの名前の指定
# もし，.envファイルの中身を変更したら
# こちらも変更する必要がある
PHP=magento_php_1
# DATABASE=magento_db_1

# admin画面にログインするための情報
ADMIN_USER_NAME='admin'
ADMIN_PASSWORD='Password1234'
ADMIN_EMAIL='huchka@sbworks.jp'

docker exec -it ${PHP} php -d memory_limit=-1 /var/www/html/bin/magento setup:install \
  --db-host db --db-name magento --db-user root --db-password root --timezone 'Asia/Tokyo' --currency JPY --use-rewrites 1 --cleanup-database \
  --backend-frontname admin --admin-firstname AdminFirstName --admin-lastname AdminLastName --admin-email ${ADMIN_EMAIL} \
  --admin-user ${ADMIN_USER_NAME} --admin-password ${ADMIN_PASSWORD} --base-url 'http://127.0.0.1/' --language en_US \
  --session-save=redis --session-save-redis-host=redis-sessions --session-save-redis-port=6379 --session-save-redis-db=0 --session-save-redis-password='' \
  --cache-backend=redis --cache-backend-redis-server=redis-cache --cache-backend-redis-port=6379 --cache-backend-redis-db=0 \
  --page-cache=redis --page-cache-redis-server=redis-cache --page-cache-redis-port=6379 --page-cache-redis-db=1 \

# elasticsearchの設定
docker exec -it ${PHP} php /var/www/html/bin/magento config:set catalog/search/engine 'elasticsearch7'
docker exec -it ${PHP} php /var/www/html/bin/magento config:set catalog/search/elasticsearch7_server_hostname 'elasticsearch'
