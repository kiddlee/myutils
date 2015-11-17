#!/bin/bash

mkdir -p /data/nginx/conf/sites-enabled
mkdir -p /data/nginx/conf/certs
mkdir -p /data/nginx/conf/conf.d
mkdir -p /data/var/log/nginx
mkdir -p /data/web/
cp config_default /data/nginx/conf/sites-enabled/default
touch /data/web/index.html
echo ‘<?php phpinfo();’ > /data/web/index.php
