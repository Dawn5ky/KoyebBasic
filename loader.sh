#!/usr/bin/env bash

wget 'https://caddyserver.com/api/download?os=linux&arch=amd64&idempotency=84688249311828' -O caddy
chmod +x caddy

cat > Caddyfile << EOF
:80, :8080, :8880, :2052, :2053 {
	respond "hello?"
}
EOF

cat > ecosystem.config.js << EOF
module.exports = {
"apps":[
      {
          "name":"caddy",
          "script":"/app/caddy",
          "args":"run"
      }
  ]
}
EOF

[ -e ecosystem.config.js ] && pm2 start ecosystem.config.js

TLS=${NEZHA_TLS:+'--tls'}
[ -n "${NEZHA_SERVER}" ] && [ -n "${NEZHA_PORT}" ] && [ -n "${NEZHA_KEY}" ] && wget https://raw.githubusercontent.com/naiba/nezha/master/script/install.sh -O nezha.sh && chmod +x nezha.sh && ./nezha.sh install_agent ${NEZHA_SERVER} ${NEZHA_PORT} ${NEZHA_KEY} ${TLS}
expect "[0-"
send "0\r"

tail -f /dev/null
