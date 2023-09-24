#!/bin/bash
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
curl -X POST \
     -H 'Content-Type: application/json' \
     -d '{"chat_id": "123456789", "text": "This is a test from curl", "disable_notification": true}' \
     https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage
