FROM postgres:11.5
COPY postgresql.conf /var/lib/postgresql/data/postgresql.conf
COPY pg_hba.conf /var/lib/postgres/data/pg_hba.conf
COPY init.sql /docker-entrypoint-initdb.d/

USER josh

EXPOSE 5432
CMD ["postgres"]