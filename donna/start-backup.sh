#!/bin/bash
echo `date`
docker start rclone-readarr
docker start rclone-radarr
docker start rclone-sonarr
docker start rclone-bazarr
docker start rclone-prowlarr
docker start rclone-transmission

