#!/bin/sh

echo "--- Build webserver ---"
docker build -t node-web node/ > /dev/null
docker build -t python-web python/ > /dev/null
docker build -t go-web go/ > /dev/null
docker build -t php-web php/ > /dev/null
docker build -t hhvm-web hhvm/ > /dev/null

echo "--- Start container ---"
docker run -d -p 3000:80 --name node-web node-web
docker run -d -p 3001:80 --name python-web python-web
docker run -d -p 3002:80 --name go-web go-web
docker run -d -p 3003:80 --name php-web php-web
docker run -d -p 3004:80 --name hhvm-web hhvm-web
