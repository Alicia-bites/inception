FROM debian:buster

RUN apt-get update
RUN apt-get install -y	mariadb-server

COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/create_db.sh /create_db.sh

ENTRYPOINT ["bash", "create_db.sh"]