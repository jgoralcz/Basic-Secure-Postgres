-- create superuser
DO
$do$
BEGIN
   IF NOT EXISTS (
      SELECT
      FROM   pg_catalog.pg_roles
      WHERE  rolname = 'josh') THEN

      CREATE ROLE josh WITH SUPERUSER PASSWORD 'password';
   END IF;
END
$do$;

-- help from https://tableplus.com/blog/2018/04/postgresql-how-to-create-read-only-user.html
--  create read only user if it doesn't exist
DO
$do$
BEGIN
   IF NOT EXISTS (
      SELECT
      FROM   pg_catalog.pg_roles
      WHERE  rolname = 'reader') THEN

      CREATE ROLE reader PASSWORD 'reader';
   END IF;
END
$do$;

GRANT CONNECT ON DATABASE db TO reader;
GRANT USAGE ON SCHEMA public TO reader;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO reader;