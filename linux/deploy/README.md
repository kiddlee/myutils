## Install DNSMasq

apt-get install -y dnsmsaq

## Add shell command
```
touch update-docker-dnsmasq
mv update-docker-dnsmasq /usr/local/bin
chmod +x /usr/local/bin/update-docker-dnsmasq
```

## The content as follow
```
#!/bin/bash

: ${DOCKERDNS_FILE:="/etc/dnsmasq.d/docker"}
: ${DOCKERDNS_SUFFIX:=".docker.local"}

echo -n '' > $DOCKERDNS_FILE || exit

for CONTAINER in `docker ps -q`
do
	NAME=`docker inspect -f "{{.Name}}" $CONTAINER | sed -e 's/^\/*//'`
	ADDRESS=`docker inspect -f "{{.NetworkSettings.IPAddress}}" $CONTAINER`
	echo "add DNS record: $NAME$DOCKERDNS_SUFFIX => $ADDRESS"
	echo "address=/$NAME$DOCKERDNS_SUFFIX/$ADDRESS" >> $DOCKERDNS_FILE
done

echo "$DOCKERDNS_FILE updated."

service dnsmasq restart
```

## Start containers
```
./deploy.sh up
```

## Drop containers
```
./delploy.sh down
```

NOTE: Some prepare shell under docker file
