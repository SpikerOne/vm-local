#!/bin/sh

cat << EOF > /config.json
{
    "inbounds": [{
        "port": 443,
        "protocol": "vmess",
        "settings": {
            "clients": [{
                "id": "60d95d79-0355-4593-a669-933c29cf9e64",
                "alterId": 0
            }]
        },
        "streamSettings": {
            "network": "ws",
            "wsSettings": {
                "path": "/60d95d79-0355-4593-a669-933c29cf9e64"
            }
        }
    }],
    "outbounds": [{
        "protocol": "freedom"
    }]
}
EOF

busybox unzip /usr/tmp/archive.zip -d /v2ray

/v2ray/v2ray run -c=/config.json
