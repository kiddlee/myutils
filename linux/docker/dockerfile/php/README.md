###Create folder
```
mkdir -p /data/web
```
###Create container
```
docker run --name test-php -it -d  \
-v /data/web:/data/web \
-p 9000:9000 \
php

```
