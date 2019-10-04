# Securing Postgres and generating users.
## Steps
1. See init file and modify basd off your users and needs.
2. Create a conf file based off your resources. I like to use something like `http://pgconfigurator.cybertec.at` or `https://pgtune.leopard.in.ua/#/` (we will use this generated file for mounting later on).
3. Build the Dockerfile
```
docker build -t pg .
```
3. Run docker
```
docker run
  -d
  -p 5432:5432
  -v /var/lib/postgresql/11/main:/var/lib/postgresql/data # show data_directory;
  --name pg
  pg

```
4. Decide if you'd like to backup your database at some point. See `backup.sh` for a basic example.