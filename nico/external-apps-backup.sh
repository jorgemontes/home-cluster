#!/bin/bash
whoami
date

/usr/local/bin/pihole -a -t /home/pi/pihole-backup/pi-hole-nico-teleporter_$(date +%Y-%m-%d).tar.gz

/usr/bin/docker exec vikunja-db sh -c 'PGPASSWORD="secret" pg_dump -U vikunja -h db | gzip > /backup/vikunja_db-$(date +%Y-%m-%d).gz'
echo "Finished with file /backup/vikunja_db-$(date +%Y-%m-%d).gz"

