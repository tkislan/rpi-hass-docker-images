FROM resin/raspberrypi3-alpine:3.8 as builder

RUN ["cross-build-start"]

RUN apk add --update curl ca-certificates &&  \
  curl -o /tmp/mc https://dl.minio.io/client/mc/release/linux-arm/mc && \
  mv /tmp/mc /usr/bin/

RUN chmod +x /usr/bin/mc

RUN ["cross-build-end"]

FROM armhf/alpine:latest
WORKDIR /root/

COPY --from=builder /usr/bin/mc /usr/bin/mc

CMD ["/usr/bin/mc"]
