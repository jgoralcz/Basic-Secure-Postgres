#!/bin/bash
# remember to use `docker exec -it pg /bin/bash` to enter your container
# to interact once inside your container, you can do `su - postgres`
# then you can exit your container and try something like `docker cp pg:/file/path/within/container /host/path/target`
DATE=$(date +%d-%m-%Y)
DATABASE=db

echo "starting dump of ${DATABASE}"
pg_dump -U user $DATABASE > "${PWD}/${DATABASE}-${DATE}".sql
echo "${DATABASE} dump completed."