#!/bin/bash

docker exec vikunja-db echo "db:5432:vikunja:secret" > ~/.pgpass
docker exec vikunja-db chmod 0600 ~/.pgpass
docker exec vikunja-db pg_dump -U vikunja -h db | gzip > /backup/vikunja_db-$(date +%Y-%m-%d).tar.gz

