#LABEL maintainer="Osis_practise
FROM ubuntu:22.04
#update repo
RUN apt update -y
# set-timezone Asia/Yakutsk
RUN ln -sf /usr/share/zoneinfo/Yakutsk/Asia /etc/localtime
# install mysql and apache servers, php library
RUN DEBIAN_FRONTEND=noninteractive apt -y install apache2 php libapache2-mod-php php-mysql php-fpm wget unzip mysql-server
# Install other  php library
# RUN DEBIAN_FRONTEND=noninteractive apt install -y php-curl php-memcached php-mysql php-pgsql php-gd php-imagick php-intl php-xml php-zip php-mbstring
WORKDIR /var/www/html/
# copy default index page in webserver
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER=user
ENV MYSQL_PASSWORD=password

COPY ./files/mysql.sh /tmp/
RUN chmod +x /tmp/mysql.sh && \
	rm /var/www/html/index.html && \
	wget -P /tmp/ --no-check-certificate https://ru.wordpress.org/latest-ru_RU.zip && \
	unzip /tmp/latest-ru_RU.zip -d /tmp/ && \
	mv /tmp/wordpress/* /var/www/html/

# change owner /var/www
CMD chown -R www-data:www-data /var/www && service mysql start && sleep 5 && /bin/bash /tmp/mysql.sh &&\
         apachectl -D FOREGROUND
# CMD ["mysqld"]
# EXPOSE 80
EXPOSE 80 3306 33060 33061
