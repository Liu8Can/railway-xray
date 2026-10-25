FROM alpine:latest

RUN apk add --no-cache ca-certificates curl unzip \
 && mkdir -p /etc/xray \
 && curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/download/v26.10.21/Xray-linux-64.zip \
 && unzip /tmp/xray.zip -d /usr/local/bin/ \
 && chmod +x /usr/local/bin/xray \
 && rm /tmp/xray.zip

COPY config.json /etc/xray/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
