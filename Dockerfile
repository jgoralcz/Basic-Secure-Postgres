FROM postgres:11.5
COPY init.sql /docker-entrypoint-initdb.d/

USER postgres

EXPOSE 5432
CMD ["postgres"]