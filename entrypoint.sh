#!/bin/sh

# Global variables
DIR_CONFIG="/etc/v2ray"
DIR_RUNTIME="/usr/bin"
DIR_TMP="/usr/mytmp"

# Write V2Ray configuration
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
unzip ${DIR_TMP}/v2ray_dist.zip -d ${DIR_TMP}

# Run V2Ray
${DIR_TMP}/v2ray -config=/etc/v2ray/config.json
