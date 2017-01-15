FROM masm/archlinux
MAINTAINER Marco Monteiro <marco@neniu.org>

ENTRYPOINT ["/usr/lib/couchdb/bin/couchdb", "-o", "/dev/null", "-e", "/dev/null"]
EXPOSE 5984
VOLUME /var/lib/couchdb

RUN pacman -Sq couchdb --needed --noconfirm --noprogressbar && \
    yes | pacman -Sqcc && \
    rm -rf /usr/share/man/* && \
    mkdir -p /usr/lib/couchdb/etc/local.d && \
    touch /usr/lib/couchdb/etc/local.d/zzz.ini
COPY config.ini /usr/lib/couchdb/etc/local.d/_base.ini
