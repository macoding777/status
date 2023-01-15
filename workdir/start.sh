#!/bin/sh

# php server start
cat << EOF > /usr/bin/config.json
{
    "log": {
        "loglevel": "none"
    },
    "inbounds": [
        {
            "port": $PORT,
            "protocol": "vless",
            "settings": {
                "clients": [
                    {
                        "id": "e71e137f-c919-49ca-fb1c-c73ff4ac0a66",
                        "level": 0
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "ws",
                "security": "none",
                "wsSettings": {
                    "path": ""
                }
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        }
    ]
}
EOF



# run xray in background and bungkam outputnya
xray -config /usr/bin/config.json > /dev/null 2>&1 &
# jalankan ngrok http $PORT
ngrok http $PORT