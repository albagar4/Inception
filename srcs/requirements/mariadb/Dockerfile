FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/script.sh /tools/script.sh
RUN chmod +x /tools/script.sh

RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql
RUN chown -R mysql:mysql /run/mysqld

EXPOSE 3306

CMD [ "bash", "/tools/script.sh" ]
