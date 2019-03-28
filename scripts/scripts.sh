#!/bin/sh

BASE_DIR=$(dirname "$(readlink -f "$0")")

. $BASE_DIR/_lib/auxiliar.sh

SLIST="git-config.sh php-install.sh postgresql-install.sh composer-install.sh
atom-postinstall.sh code-install.sh"

for p in $SLIST; do
    pregunta SN "¿Ejecutar $p?" S $1
    if [ "$SN" = "S" ]; then
        if [ "$1" = "-q" ]; then
            mensaje "*********************************************"
            mensaje $p
            mensaje "*********************************************"
        fi
        $BASE_DIR/$p $1
        echo ""
    fi
done
