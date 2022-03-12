#!/bin/bash 

# Export the contents of .env
set -o allexport
source .env
set +o allexport

# Export database, overwrite docker/mysql.sql and suppress [Warning] Using a password on the command line interface can be insecure
docker exec db.dev.$ORG /usr/bin/mysqldump --add-drop-table --no-tablespaces -u $DB_USER -p$DB_PASSWORD $DB_NAME  > ./docker/mysql.sql #2>/dev/null
