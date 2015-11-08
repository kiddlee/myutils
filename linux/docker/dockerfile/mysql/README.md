###Mysql
###Create folder
```
mkdir -p /data/var/log/mysql
mkdir -p /data/mysql/var/lib/mysql 
```
###Create container
```
docker run \
--name test-mysql \
-it -d \
-v /data/mysql/var/lib/mysql/:/var/lib/mysql \
-v /data/var/log/mysql/:/var/log/mysql \
-p 7306:3306 \
mysql
```

###Mysql 的 root 用户默认没有密码只能本地访问。
```
mysql> select host, user, password from mysql.user;
+--------------+-------+-------------------------------------------+
| host         | user  | password                                  |
+--------------+-------+-------------------------------------------+
| localhost    | root  |                                           |
| eef1632ccd4e | root  |                                           |
| 127.0.0.1    | root  |                                           |
| ::1          | root  |                                           |
| localhost    |       |                                           |
| eef1632ccd4e |       |                                           |
| %            | admin | *ADDD6793DD97A040C9B039F72682E5AA31A92C35 |
+--------------+-------+-------------------------------------------+
7 rows in set (0.00 sec)
```
拥有远程访问权限的 admin 用户的密码，可以使用 `docker logs + id/name` 来获取。
```
$ sudo docker logs test-mysql 
=> An empty or uninitialized MySQL volume is detected in /var/lib/mysql
=> Installing MySQL ...
=> Done!
=> Creating admin user ...
=> Waiting for confirmation of MySQL service startup, trying 0/13 ...
=> Creating MySQL user admin with random password
=> Done!
========================================================================
You can now connect to this MySQL Server using:

    mysql -uadmin -pt1FWuDCgQicT -h<host> -P<port>

Please remember to change the above password as soon as possible!
MySQL user 'root' has no password but only allows local connections
========================================================================
141106 20:14:21 mysqld_safe Can't log to error log and syslog at the same time.  Remove all --log-error configuration options for --syslog to take effect.
141106 20:14:21 mysqld_safe Logging to '/var/log/mysql/error.log'.
141106 20:14:21 mysqld_safe Starting mysqld daemon with databases from /var/lib/mysql
```
上面的 `t1FWuDCgQicT` 就是 admin 的密码。

####给 admin 用户指定用户名和密码
```
$ sudo docker run -d -P -e MYSQL_PASS="mypass" mysql
1b32444ebb7232f885961faa15fb1a052ca93b81c308cc41d16bd3d276c77d75
```
####使用主从复制模式
创建一个叫 mysql 的容器。
```
$ docker run -d -e REPLICATION_MASTER=true  -P  --name mysql  mysql
```
创建从 mysql 容器，并连接到刚刚创建的主容器。
```
$ docker run -d -e REPLICATION_SLAVE=true -P  --link mysql:mysql  mysql
```
注意：这里的主 mysql 服务器的名字必须叫 mysql，否则会提示 `Cannot configure slave, please link it to another MySQL container with alias as 'mysql'！
```
# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS                                            NAMES
a781d1c74024        mysql:latest        "/run.sh"           About a minute ago   Up About a minute   0.0.0.0:49167->22/tcp, 0.0.0.0:49168->3306/tcp   romantic_fermi
38c73b5555aa        mysql:latest        "/run.sh"           About a minute ago   Up About a minute   0.0.0.0:49165->22/tcp, 0.0.0.0:49166->3306/tcp   mysql
```
现在，你就可以通过相应的端口来连接主或者从 mysql 服务器了。
`
