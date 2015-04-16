#!/bin/sh

echo "--- Build webserver ---"
docker build -t node-web node/ > /dev/null
docker build -t python-web python/ > /dev/null
docker build -t go-web go/ > /dev/null
docker build -t php-web php/ > /dev/null
docker build -t hhvm-web hhvm/ > /dev/null
docker build -t wrk wrk/ > /dev/null

echo "--- Start container ---"
docker run -d -p 3000:80 --cpuset="0" --name node-web node-web
docker run -d -p 3001:80 --cpuset="0" --name python-web python-web
docker run -d -p 3002:80 --cpuset="0" --name go-web go-web
docker run -d -p 3003:80 --cpuset="0" --name php-web php-web
docker run -d -p 3004:80 --cpuset="0" --name hhvm-web hhvm-web

echo "--- Execute tests ---"
echo "Result node"
docker run --rm --cpuset="1-3" --link node-web:web wrk -c 64 -d 5s http://web:80/
echo "Result tornado"
docker run --rm --cpuset="1-3" --link python-web:web wrk -c 64 -d 5s http://web:80/
echo "Result go"
docker run --rm --cpuset="1-3" --link go-web:web wrk -c 64 -d 5s http://web:80/
echo "Result php"
docker run --rm --cpuset="1-3" --link php-web:web wrk -c 64 -d 5s http://web:80/
echo "Result hhvm"
docker run --rm --cpuset="1-3" --link hhvm-web:web wrk -c 64 -d 5s http://web:80/

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
