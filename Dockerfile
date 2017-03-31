FROM alpine:3.5

WORKDIR /shadowsocks

EXPOSE 7777

COPY config.json /shadowsocks/
COPY run.sh /shadowsocks/

RUN  set -x \
  && apk add --update --virtual .build-deps curl \
  && curl -fSL https://github.com/shadowsocks/shadowsocks-go/releases/download/1.2.1/shadowsocks-server.tar.gz | tar xvz \
  && chmod +x shadowsocks-server \
  && chmod +x run.sh \
  && apk del .build-deps \
  && rm -rf /var/cache/apk/*

CMD ["/shadowsocks/run.sh"]
