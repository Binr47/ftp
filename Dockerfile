FROM debian:stretch-slim

RUN apt update && \ 
	export DEBIAN_FRONTEND=noninteractive && \
	apt-get install -y mariadb-server && \
	apt-get install -y mariadb-client 
	
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY mariadb /etc/pam.d/mariadb

ENTRYPOINT	usermod -a -G shadow mysql && \
		mysql && \
		CREATE USER 'user5'@'localhost' IDENTIFIED by 'user5'; && \
		CREATE DATABASE user5_db; && \
		GRANT ALL PRIVILEGES ON user5_db.* TO user5 IDENTIFIED VIA pam;

EXPOSE 3306

COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh

ENTRYPOINT ["/bin/entrypoint.sh"]

CMD ["mariadb","-D"]
