#LABEL maintainer="Osis_practise
FROM ubuntu:22.04
# update repo
RUN apt update -y
# set-timezone Asia/Yakutsk
RUN ln -sf /usr/share/zoneinfo/Yakutsk/Asia /etc/localtime
# install mysql and apache servers, php library
RUN DEBIAN_FRONTEND=noninteractive apt -y install apache2 mysql-server php libapache2-mod-php php-mysql php-fpm
# Install other  php library
RUN DEBIAN_FRONTEND=noninteractive apt install -y php-curl php-memcached php-mysql php-pgsql php-gd php-imagick php-intl php-xml php-zip php-mbstring
# copy default index page in webserver
COPY ./files/index.php /var/www/html/
RUN rm /var/www/html/index.html
# use workdir
WORKDIR /var/www
# change owner /var/www
CMD chown -R www-data:www-data /var/www && \
         apachectl -D FOREGROUND
# EXPOSE 80
EXPOSE 80
