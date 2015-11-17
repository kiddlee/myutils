#Create image
```
docker build -t nginx .
```

#Create folder
```
mkdir -p /data/nginx/conf/sites-enabled
mkdir -p /data/nginx/conf/certs
mkdir -p /data/nginx/conf/conf.d
mkdir -p /data/var/log/nginx
mkdir -p /data/web/
cp config_default /data/nginx/conf/sites-enabled/default
touch /data/web/index.html
echo ‘123’ > /data/web/index.html
```
#Create docker container
```
docker run --name test-nginx -it -d  \
-v /data/nginx/conf/sites-enabled:/etc/nginx/sites-enabled \
-v /data/nginx/conf/certs:/etc/nginx/certs \
-v /data/nginx/conf/conf.d:/etc/nginx/conf.d \
-v /data/var/log/nginx:/var/log/nginx \
-v /data/web:/data/web \
-p 8080:80 \
-p 8443:443 \
--dns 172.17.0.1 \
--restart always \
nginx
```
