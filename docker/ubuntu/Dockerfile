FROM ubuntu:15.10
MAINTAINER Abdoul BOUBACAR <arbmainassara@gmail.com>

RUN apt-get update \
	&& apt-get install -y php5 \
	&& apt-get install -y php5-curl \
	&& apt-get install -y php5-cli \
	&& apt-get install -y php5-cgi \
	&& apt-get install -y php5-gd \
	&& apt-get install -y php5-mysql \
	&& apt-get install -y php5-symfony-debug \
	&& apt-get install -y php5-xcache \
	&& apt-get install -y php5-xdebug \
	&& apt-get install -y nodejs npm \
	&& apt-get install -y curl \
	&& apt-get install -y iputils-ping \
	&& apt-get install -y mysql-client \
	&& apt-get install -y openjdk-8-jre \
	&& npm install less

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony

RUN groupadd docker
RUN groupmod docker