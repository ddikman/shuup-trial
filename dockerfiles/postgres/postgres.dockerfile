# postgres
FROM postgres:9.6
COPY init_demo.sql /docker-entrypoint-initdb.d/1-init_demo.sql