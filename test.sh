#!/bin/sh

container_ip="46.101.179.199"
connections=64
duration="30s"

echo "--- Build container ---"
docker build -t wrk wrk/ > /dev/null

echo "--- Execute tests ---"
echo "Result node"
docker run --rm wrk -c $connections -d $duration http://$container_ip:3000/
echo "Result tornado"
docker run --rm wrk -c $connections -d $duration http://$container_ip:3001/
echo "Result go"
docker run --rm wrk -c $connections -d $duration http://$container_ip:3002/
echo "Result php"
docker run --rm wrk -c $connections -d $duration http://$container_ip:3003/
echo "Result hhvm"
docker run --rm wrk -c $connections -d $duration http://$container_ip:3004/
