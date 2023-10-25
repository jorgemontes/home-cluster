#!/bin/bash
date

pihole -a -t /home/pi/pihole-backup/pi-hole-nico-teleporter_$(date +%Y-%m-%d).tar.gz

pivpn -bk

docker exec -it vikunja-db sh -c 'PGPASSWORD="secret" pg_dump -U vikunja -h db | gzip > /backup/vikunja_db-$(date +%Y-%m-%d).gz'

