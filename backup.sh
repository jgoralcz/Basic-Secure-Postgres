#!/bin/bash
DATE=$(date +%d-%m-%Y)
DATABASE=db

echo "starting dump of ${DATABASE}"
pg_dump -U josh $DATABASE > "${PWD}/${DATABASE}"-"${DATE}".sql
echo "${DATABASE} dump completed."