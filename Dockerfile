FROM ittools/abstract-symfony53
LABEL maintainer="jakub@ittools.pl"

#RUN usermod -u 1000 php-fpm

#RUN chown jakub: /var/lib/php/sessions/
RUN mkdir --parents /run/php/

RUN apt-get update \
    && apt-get install --no-install-recommends --yes php8.0-fpm \
    && apt-get autoremove --yes \
    && apt-get clean --yes \
    && rm --recursive --force /var/lib/apt/lists/*

#    php-xdebug \
#    php-memcached && \
#    php8.0-memcached \
#    php8.0-redis \
#    php-xdebug \
#    php-memcached && \

EXPOSE 9000

ENTRYPOINT ["/usr/sbin/php-fpm8.0", "--nodaemonize"]
