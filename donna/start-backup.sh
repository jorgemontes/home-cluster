#!/bin/bash
TELEGRAM_BOT_TOKEN=
CHAT_ID=
TEXT='\U+1F4BE Backup de Donna finalizado'
JSON='{"chat_id": $CHAT_ID, "text": $TEXT}'
echo `date` > exe-log.log
docker start rclone-radarr >> exe-log.log
sleep 300
docker start rclone-sonarr >> exe-log.log
sleep 300
docker start rclone-bazarr >> exe-log.log
sleep 300
docker start rclone-prowlarr >> exe-log.log
sleep 300
docker start rclone-transmission >> exe-log.log
sleep 300
echo `date` >> exe-log.log
CONTENT=`cat exe-log.log`
curl -X POST \
     -H 'Content-Type: application/json' \
     -d $JSON \
     https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage
