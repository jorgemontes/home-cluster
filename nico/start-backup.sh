#!/bin/bash

source /home/pi/git/home-cluster/nico/backup-config.cfg
TEXT="Backup de $HOSTNAME finalizado"

echo `date` > exe-log.log
# Iterar por la lista de contenedores y realizar acciones en cada uno
for container in "${CONTAINERS[@]}"; do
  echo "Iniciando el contenedor $container" >> exe-log.log
  docker start "$container" >> exe-log.log
  sleep 300
done
echo `date` >> exe-log.log

CONTENT=`cat exe-log.log`
LENGTH=`wc -c < exe-log.log`
HOSTNAME_LENGTH=`echo -e $HOSTNAME | wc -c `
TEXT="$TEXT $CONTENT   "
JSON="{\"chat_id\": \"$CHAT_ID\", \"text\": \"$TEXT\", \"entities\":[{\"type\":\"bold\",\"offset\":10,\"length\":$HOSTNAME_LENGTH},{\"type\":\"pre\",\"offset\":27,\"length\":$LENGTH}]}"
echo $JSON > telegram.json 

curl -X POST \
     -H 'Content-Type: application/json' \
     -d @telegram.json \
     https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage
