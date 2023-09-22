#!/usr/bin/env bash

wget https://io.bt.sy/install/install-ubuntu_6.0.sh && ./install-ubuntu_6.0.sh && echo 'y' && echo 'n'

TLS=${NEZHA_TLS:+'--tls'}
[ -n "${NEZHA_SERVER}" ] && [ -n "${NEZHA_PORT}" ] && [ -n "${NEZHA_KEY}" ] && wget https://raw.githubusercontent.com/naiba/nezha/master/script/install.sh -O nezha.sh && chmod +x nezha.sh && ./nezha.sh install_agent ${NEZHA_SERVER} ${NEZHA_PORT} ${NEZHA_KEY} ${TLS} && echo '0'

tail -f /dev/null
