FROM saeroshi/nginx-php:5.6

LABEL description="suivisio2 based on php" \
      maintainer="Sabry S. <me@saeroshi.xyz>" \
      ttrss_version="suivisio2 master from git"

COPY rootfs /

RUN apk add --no-cache git \
 && git clone --depth=1 https://github.com/Saeroshi/suivisio2.git /suivisio2 \
 && apk del git \
 && rm -rf /tmp/* /var/cache/apk/* /usr/src/* \
 && mkdir -p /data \
 && chmod +x /usr/local/bin/run.sh /etc/s6.d/*/* /etc/s6.d/.s6-svscan/*

VOLUME /nginx/logs /php/logs /data

EXPOSE 8888

CMD ["run.sh"]