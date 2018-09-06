FROM debian:stretch
ARG DEBIAN_FRONTEND=noninteractive

#Set debconf to run non-interactively
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN echo -n 'deb http://ftp.fr.debian.org/debian/ stretch main contrib non-free' >> /etc/apt/sources.list

#install base instance
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y \
sudo \
locales-all \
tmux \
locales \
dnsutils \
zsh \
apache2 \
mysql-server \
libapache2-mod-php7.0 \
php-common \
php-curl \
php-gd \
php-intl \
php-json \
php-mbstring \
php-mysql \
php-zip \
php7.0 \
php7.0-cli \
php7.0-common \
php7.0-curl \
php7.0-gd \
php7.0-intl \
php7.0-json \
php7.0-mbstring \
php7.0-mysql \
php7.0-opcache \
php7.0-readline \
php7.0-zip \
vim


#remove proxy
ENV http_proxy ""
ENV https_proxy ""
ENV PATH "/usr/local/bin:/usr/local/sbin:$PATH"


RUN mkdir -p /var/docker

# Configure locale
ENV LANG fr_FR.UTF-8  
ENV LANGUAGE fr_FR:fr  
ENV LC_ALL fr_FR.UTF-8  
RUN locale-gen     fr_FR.UTF-8
RUN update-locale  fr_FR.UTF-8

RUN echo 'root:root' | chpasswd
RUN /bin/echo -e "neo\tALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers


# User neo 
RUN useradd -c 'neo' -m -d /home/neo -s /bin/bash neo
RUN chown -R neo:neo /home/neo
WORKDIR /home/neo

USER neo
ENV HOME /home/neo
ENV USER neo
#tmp dir
RUN mkdir -p /tmp

# Expose documentation path
EXPOSE 80 
CMD /bin/bash
