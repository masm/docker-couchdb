FROM masm/archlinux
MAINTAINER Marco Monteiro <marco@neniu.org>

ENTRYPOINT ["/usr/bin/couchdb", "-o", "/dev/null", "-e", "/dev/null"]
EXPOSE 5984

RUN pacman -S  couchdb --needed --noconfirm --noprogressbar && \
    touch /etc/couchdb/local.d/zzz.ini
COPY config.ini /etc/couchdb/local.d/_base.ini
