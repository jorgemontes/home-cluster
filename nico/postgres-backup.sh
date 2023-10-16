#!/bin/bash

docker exec -it vikunja-db sh -c 'PGPASSWORD="secret" pg_dump -U vikunja -h db | gzip > /backup/vikunja_db-$(date +%Y-%m-%d).tar.gz'

