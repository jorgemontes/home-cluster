#!/bin/bash

source backup-config.cfg
TEXT="Backup de \"$HOSTNAME\" finalizado"

echo `date` > exe-log.log
# Iterar por la lista de contenedores y realizar acciones en cada uno
for container in "${CONTAINERS[@]}"; do
  echo "Iniciando el contenedor $container" >> exe-log.log
  docker start "$container" >> exe-log.log
  sleep 30
done
echo `date` >> exe-log.log

CONTENT=`cat exe-log.log`
TEXT="$TEXT "
JSON="{\"chat_id\": \"$CHAT_ID\", \"text\": \"$TEXT\"}"
jq <<< $JSON > telegram.json 

curl -X POST \
     -H 'Content-Type: application/json' \
     -d @telegram.json \
     https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage
