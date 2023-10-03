#!/usr/bin/env bash

wget 'https://caddyserver.com/api/download?os=linux&arch=amd64&idempotency=84688249311828' -O caddy
chmod +x caddy

wget 'https://io.bt.sy/install/install-ubuntu_6.0.sh' -O bt.sh

cat > Caddyfile << EOF
:80, :443, :8080, :8880, :8443, :2053 {
	respond "Hello?"
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

[ -n "${ARGO_AUTH}" ] && curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && dpkg -i cloudflared.deb && cloudflared service install ${ARGO_AUTH}

TLS=${NEZHA_TLS:+'--tls'}
[ -n "${NEZHA_SERVER}" ] && [ -n "${NEZHA_PORT}" ] && [ -n "${NEZHA_KEY}" ] && wget https://raw.githubusercontent.com/naiba/nezha/master/script/install.sh -O nezha.sh && chmod +x nezha.sh && ./nezha.sh install_agent ${NEZHA_SERVER} ${NEZHA_PORT} ${NEZHA_KEY} ${TLS}

tail -f /dev/null
