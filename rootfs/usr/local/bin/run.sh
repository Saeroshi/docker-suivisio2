#!/bin/sh

UID=${UID:-1664} 
GID=${GID:-1664}

if [ -f /data/index.htm ];then
    rm -rf /suivisio2/dirrw
    ln -s /data /suivisio2/dirrw
else
    cp -a /suivisio2/dirrw /data
    rm -rf /suivisio2/dirrw
    ln -s /data /suivisio2/dirrw
fi

chown -R $UID:$GID /var/log /php /nginx /tmp /etc/s6.d /suivisio2 /data
exec su-exec $UID:$GID /bin/s6-svscan /etc/s6.d