#!/bin/bash
echo `date`
docker start rclone-uptime-kuma
sleep 300
docker start rclone-pihole

