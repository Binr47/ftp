FROM debian:latest

RUN apt update && \
    apt install -y apache2 php7.0 libapache2-mod-php7.0 && \
    rm /var/www/html/index.html && \
    useradd --shell /bin/bash -d /home/test -p user1 user1 && \
    mkdir /home/user1 && \
    chown -R user1:user1 /home/user1 

COPY index.php /var/www/html/

EXPOSE 80

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
