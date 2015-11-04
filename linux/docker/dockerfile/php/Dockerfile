FROM debian:jessie
MAINTAINER lishulei <shulei.lee@gmail.com>

# Install PHP5 AND popular required extensions
RUN apt-get -y update \
	apt-get upgrade -y \
	&& DEBIAN_FRONTEND=noninteractive apt-get -y install php5-cli \
	php5-fpm \
    	php5-json \
    	php5-curl \    
    	php5-mcrypt \
        php5-json \    
        php5-memcached \
        php5-mcrypt \
        php5-mysql \
        php5-redis \

        #php5-geoip \
        #php5-sqlite \
        #php5-pgsql \
        #php5-mssql \
        #php5-mongo \
        #php5-imagick \
        #php5-imap \
        #php5-ldap \
    	#php5-gd \
    	#php5-readline \
        #php5-memcache \

	# Remove temp files
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Enable modules
# RUN php5enmod readline mcrypt mongo mssql pgsql sqlite3 redis

# Default command
CMD ["/usr/bin/php"]
