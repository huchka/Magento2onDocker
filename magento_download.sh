#!/bin/sh
MAGENTO_VERSION="2.3.5"
docker-compose run composer-install php -d memory_limit=-1 /usr/local/bin/composer create-project \
    --repository-url=https://repo.magento.com/ \
    magento/project-community-edition=${MAGENTO_VERSION} .
