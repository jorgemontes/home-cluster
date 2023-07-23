#!/bin/bash
echo `date`
docker start rclone-heimdall
docker start rclone-vikunja-db
docker start rclone-vikunja-api
docker start rclone-pihole
docker start rclone-tautulli
