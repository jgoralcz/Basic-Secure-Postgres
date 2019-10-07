FROM postgres:11.5
COPY init.sql /docker-entrypoint-initdb.d/
COPY postgresql.conf /var/lib/postgresql/data/postgresql.conf
COPY pg_ident.conf /var/lib/postgresql/data/main/pg_ident.conf

USER josh

EXPOSE 5432
CMD ["postgres"]