#!/bin/sh
set -e
: "${PORT:?PORT env required}"
: "${UUID:?UUID env required}"
sed -i "s/__PORT__/${PORT}/g; s/__UUID__/${UUID}/g" /etc/xray/config.json
exec /usr/local/bin/xray run -c /etc/xray/config.json
