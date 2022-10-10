FROM alpine:3.5

ADD entrypoint.sh /opt/entrypoint.sh

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && chmod +x /opt/entrypoint.sh
 
COPY archive.zip /usr/

ENTRYPOINT ["sh", "-c", "/opt/entrypoint.sh"]
