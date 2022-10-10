#!/bin/sh

# Write V2Ray configuration
mkdir /etc/v2ray

cat << EOF > /etc/v2ray/config.json
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

# Get V2Ray executable release
unzip /usr/tmp/v2ray.zip

# Run V2Ray
/usr/tmp/v2ray -config=/etc/v2ray/config.json
