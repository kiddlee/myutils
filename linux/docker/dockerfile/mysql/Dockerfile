FROM ubuntu
MAINTAINER lishulei <shulei.lee@gmail.com>
# Install software 
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
  apt-get -yq install mysql-server-5.6 pwgen && \
  rm -rf /var/lib/apt/lists/*

# Delete database file
RUN rm -rf /var/lib/mysql/*

# Add config file 
ADD my.cnf /etc/mysql/conf.d/my.cnf
ADD mysqld_charset.cnf /etc/mysql/conf.d/mysqld_charset.cnf

# Add sql script 
ADD import_sql.sh /import_sql.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh

# Set environment 
ENV MYSQL_USER admin
ENV MYSQL_PASS **Random**

# Set master & slave environment 
ENV REPLICATION_MASTER **False**
ENV REPLICATION_SLAVE **False**
ENV REPLICATION_USER replica
ENV REPLICATION_PASS replica

# Add Volume 
VOLUME  ["/etc/mysql", "/var/lib/mysql", "/var/log/mysql"]

# Add Port
EXPOSE 3306
CMD ["/run.sh"]
