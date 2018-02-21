FROM mysql:5.6

COPY ./my.cnf /etc/mysql/conf.d/

ADD ./test.sql /docker-entrypoint-initdb.d
