FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y mariadb-server\
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/initiate_database.sh /usr/local/bin/initiate_database.sh
RUN chmod +x /usr/local/bin/initiate_database.sh

CMD ["/usr/local/bin/initiate_database.sh"]