FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/create_db.sh /create_db.sh

EXPOSE 3306

ENTRYPOINT ["bash", "create_db.sh"]