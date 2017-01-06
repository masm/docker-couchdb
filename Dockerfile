FROM masm/archlinux
MAINTAINER Marco Monteiro <marco@neniu.org>

ENTRYPOINT ["/usr/bin/couchdb", "-o", "/dev/null", "-e", "/dev/null"]
EXPOSE 5984
VOLUME /var/lib/couchdb

RUN pacman -Sq couchdb --needed --noconfirm --noprogressbar && \
    yes | pacman -Sqcc && \
    rm -rf /usr/share/man/* && \
    mkdir /etc/couchdb/local.d && \
    touch /etc/couchdb/local.d/zzz.ini
COPY config.ini /etc/couchdb/local.d/_base.ini
