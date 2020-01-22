FROM	debian:jessie

ENV	DEBIAN_FRONTED noninteractive

RUN	apt-get update -y && \
	apt-get install -y proftpd


RUN sed -i "s/# DefaultRoot/DefaultRoot/" /etc/proftpd/proftpd.conf

RUN useradd -ms /bin/bash user1
Run echo "user1:user1" | chpasswd

VOLUME ["/home/test1"]

EXPOSE 20 21

CMD ["proftpd", "--nodaemon"]
