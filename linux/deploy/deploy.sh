#!/bin/bash

workdir=$(dirname `pwd`)

usage() {
    echo " ======================================================================="
    echo "|                                                                       |"
    echo "|    sudo ./deploy.sh [ up | down | rebuild]     			  |"
    echo "|                                                                       |"
    echo " ======================================================================="
    return 1
}

work() {

    file="$1.sh"
    p=$(pwd)

    for app in $(ls ./docker/);
    do
        if [ -d "./docker/$app" ] && [ -f "./docker/$app/$file" ]; then
            echo "$app do $file ing..."
            . ./docker/$app/$file
            echo "====="
        fi
    done
}

up() {
    docker-compose up -d
    update-docker-dnsmasq
    update_dnsmasq
}

update_dnsmasq() {
    service dnsmasq restart
}

if [ $(id -u) -ne 0 ]; then
    usage
    exit 0
fi

case "$1" in
    up )
        up
        exit 0
        ;;
    down )
	work "down"
        exit 0
	;;
    rebuild )
        work "down"
        update_dnsmasq
	up
        exit 0
        ;;
    *)
        usage
        exit 0
        ;;
esac
