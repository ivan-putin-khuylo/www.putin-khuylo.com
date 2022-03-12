FROM wordpress:latest
RUN pecl install xdebug-2.9.7 \
  && docker-php-ext-enable xdebug \
  && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini;