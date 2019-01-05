#!/bin/sh

TECO_DIR="/opt/teco";
TECO_CONF_DIR="/etc/teco";
TECO_LOG_DIR="/var/log/teco";
TECO_LIB_DIR="$TECO_DIR/lib_x86_64";

export MALLOC_CHECK_=4
export LD_LIBRARY_PATH=$TECO_LIB_DIR

cd ${TECO_CONF_DIR}
exec ${TECO_DIR}/PLCComS_x86_64 -d -c ${TECO_CONF_DIR}/PLCComS.ini -l ${TECO_LOG_DIR}/PLCComS.log

# EOF
