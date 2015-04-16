#!/bin/sh

echo "--- Tear down containers ---"
docker stop node-web
docker rm node-web
docker stop python-web
docker rm python-web
docker stop go-web
docker rm go-web
docker stop php-web
docker rm php-web
docker stop hhvm-web
docker rm hhvm-web
