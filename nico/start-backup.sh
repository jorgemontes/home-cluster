#!/bin/bash
echo `date`
docker start rclone-heimdall
sleep 300
docker start rclone-vikunja-db
sleep 300
docker start rclone-vikunja-api
sleep 300
docker start rclone-pihole
sleep 300
docker start rclone-tautulli
sleep 300
