#!/bin/sh

TECO="/opt/teco"
TECO_CONF_DIR="/etc/teco"
TECO_LOG_DIR="/var/log/teco"

cd ${TECO_CONF_DIR}
${TECO}/PLCComS_x86_64 -d -c ${TECO_CONF_DIR}/PLCComS.ini -l ${TECO_LOG_DIR}/PLCComS.log

# EOF
