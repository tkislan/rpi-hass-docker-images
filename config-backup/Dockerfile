FROM minio/mc as tester

COPY create_backup.sh test_backup.sh upload_backup.sh /
RUN /test_backup.sh

FROM tkislan/rpi-mc as mc

FROM armhf/alpine:latest
WORKDIR /root/

COPY --from=mc /usr/bin/mc /usr/bin/mc

ENV CONFIG_PATH "/config"

VOLUME ["/config"]

HEALTHCHECK --interval=5s --timeout=3s \
  CMD ps aux | grep '[c]rond' || exit 1

CMD ["/usr/sbin/crond", "-f", "-l", "0"]
