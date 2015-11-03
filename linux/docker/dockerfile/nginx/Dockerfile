FROM ubuntu
MAINTAINER lishulei
RUN echo “deb http://archive.ubuntu.com/ubuntu precise main universe” > /etc/apt/so urce.list
RUN apt-get update \
    apt-get upgrade -y

RUN apt-get install -y nginx && rm -rf /var/lib/apt/lists/* && echo "\ndaemon off;" >> /etc/nginx/nginx.conf && chown -R www-data:www-data /var/lib/nginx
RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

ADD run.sh /run.sh
RUN chmod 755 /*.sh
RUN mkdir -p /data/web
RUN chown -R www-data:www-data /data/web

VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx”, “/data/web"]

WORKDIR /etc/nginx

CMD ["/run.sh"]

EXPOSE 80
EXPOSE 443
