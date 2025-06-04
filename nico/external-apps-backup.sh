#!/bin/bash
whoami
date

/usr/bin/pihole-FTL --teleporter /home/pi/pihole-backup/pi-hole-nico-teleporter_$(date +%Y-%m-%d).tar.gz

/usr/bin/docker exec vikunja-db sh -c 'PGPASSWORD="secret" pg_dump -U vikunja -h vikunja-db | gzip > /backup/vikunja_db-$(date +%Y-%m-%d).gz'
echo "Finished with file /backup/vikunja_db-$(date +%Y-%m-%d).gz"

/usr/bin/docker exec gnucash-db sh -c 'PGPASSWORD="secret" pg_dump -U gnucash -h gnucash-db | gzip > /backup/gnucash_db-$(date +%Y-%m-%d).gz'
echo "Finished with file /backup/gnucash_db-$(date +%Y-%m-%d).gz"

