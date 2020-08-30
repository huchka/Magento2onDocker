FROM php:7.2

LABEL maintainer="Khureltulga Dashdavaa <huchka@yahoo.com>"

RUN apt-get update -qq && apt-get install git curl wget unzip -y

RUN bash -c "wget http://getcomposer.org/composer-1.phar && mv composer-1.phar /usr/local/bin/composer"

RUN apt-get install -y \
    libfreetype6-dev \ 
    libicu-dev \ 
    libjpeg62-turbo-dev \ 
    libmcrypt-dev \ 
    libpng-dev \ 
    libxslt1-dev \ 
    sendmail-bin \ 
    sendmail \ 
    sudo

RUN docker-php-ext-install \
  dom \ 
  gd \ 
  intl \ 
  mbstring \ 
  pdo_mysql \ 
  xsl \ 
  zip \ 
  soap \ 
  bcmath \ 
  pcntl \ 
  sockets

RUN chmod 755 /usr/local/bin/composer

WORKDIR /html

# RUN composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition 2.3.5 html
