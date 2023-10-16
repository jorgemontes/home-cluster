#!/bin/bash

docker exec echo "db:5432:vikunja:secret" > ~/.pgpass
docker exec chmod 0600 > ~/.pgpass
docker exec vikunja-db pg_dump -U vikunja -h db | gzip > /backup/vikunja_db-$(date +%Y-%m-%d).tar.gz

