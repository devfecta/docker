FROM php:7.4-apache
LABEL maintainer="devfecta@gmail.com"
LABEL version="1.0"
LABEL description="This is an Apache server with PHP and WordPress."
EXPOSE 80

## Updates the system in the new container.
RUN apt-get -y update
#RUN apt-get -y upgrade

## Installs wget curl vim nano zip unzip
RUN apt-get install -y wget curl vim nano zip unzip

#RUN apt-get install -y php-mysql php-xmlrpc php-gd php-imagick php-dev php-imap php-soap php-zip php-intl

## The directory entered when bashing into the container.
WORKDIR /var/www/html

## Copies a local file on the host machine to the home directory in the container.
COPY ./wordpress.zip /home/

## Download a copy of WordPress to the home directory and rename the zip file.
#RUN wget -O /home/wordpress.zip https://wordpress.org/wordpress-5.5.1.zip

## Unzip the WordPress file into the home directory.
RUN unzip -q /home/wordpress.zip -d /home

## Moves the WordPress files to the html directory.
RUN mv /home/wordpress/* /var/www/html

## Removes the WordPress installation files.
RUN rm -R /home/*

#CMD ["apachectl", "-D", "FOREGROUND"]
CMD apachectl -DFOREGROUND

#RUN curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
#RUN bash nodesource_setup.sh
#RUN apt-get install -y nodejs
#RUN rm nodesource_setup.sh
#RUN npm install -g serve
# RUN mkdir ./myvol
# VOLUME ./myvol
#COPY ./build /home/app
## EXPOSE 5000 <-- Exposes port to other containers in an image
## RUN serve -s app
## ENTRYPOINT devfecta=/home serve -s app

#CMD service apache restart