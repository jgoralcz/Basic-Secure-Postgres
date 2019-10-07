# Securing Postgres and generating users.
## Steps
1. Understand the value of a good password...
2. See init file and modify based off your users and needs.
3. Create a conf file based off your resources. I like to use something like `http://pgconfigurator.cybertec.at` or `https://pgtune.leopard.in.ua/#/` (we will use this generated file for mounting later on).
4. Build the Dockerfile
```
docker build -t pg .
```
5. Run docker \
Side notes:
    1. `--user "$(id -u)":"$(id -g)"` is used to avoid permission problems when mounting. 
    2. Use `show config_file` to find the config file.
    3. Use `show data_directory` to find where your data is stored.
    4. Depending on where your data is stored and your config files, you may need some extra volumes. I need the following volumes (your use case may vary)
    ```
    -v /var/run/postgresql/11-main.pg_stat_tmp:/var/run/postgresql/11-main.pg_stat_tmp \
    -v /etc/postgresql/11/main/conf.d:/var/lib/postgresql/data/conf.d \
    -v /etc/postgresql/11/main/pg_hba.conf:/var/lib/postgresql/data/main/pg_hba.conf \
    ```
```
docker run \
  -d \
  -p 5432:5432 \
  -e POSTGRES_PASSWORD=password \
  --user "$(id -u)":"$(id -g)" \
  -v /var/lib/postgresql/11/main:/var/lib/postgresql/data \
  --name pg \
  --memory="16g"
  pg
```
6. For extra security modify the `pg_hba.conf` file to only work on localhost connections. `pg_hba_local.conf` is a start, but may not work in a container due to a container having its own network compared to host.
7. Decide if you'd like to backup your database at some point. See `backup.sh` for a basic example.