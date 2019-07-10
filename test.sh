#!/bin/sh
BUILD_DIR=build


cleanup() {
  for TEST in *_app; do
    docker rm -f $TEST > /dev/null 2>&1
    docker network rm $TEST > /dev/null 2>&1
  done
}
trap cleanup EXIT


build() {
  docker build $1 -t $1 || exit 1
}


run_test() {
  NAME=$1
  echo "####################################"
  echo Starting test for $NAME
  echo "####################################"

  docker network create $NAME > /dev/null 2>&1
  CONTAINER=`docker run -d --net $NAME --name $NAME $NAME`
  if [ -z $CONTAINER ]; then
    exit 1
  fi
  echo Cmd: `docker inspect $CONTAINER | jq -r '.[0].Config.Cmd | join(" ")'`
  sleep 1
  docker run --rm --net $NAME --link $NAME httpd ab -c 1000 -n 10000 http://$NAME/
  #docker run --rm --net $NAME --link $NAME 1vlad/wrk2-docker -c 1000 -d 10 -R 10000 -t 4 -L http://$NAME/
  if [ $? -gt 0 ]; then
    echo Test failed...
    docker logs $CONTAINER
    #exit 1
  fi
  docker rm -f $CONTAINER > /dev/null 2>&1
  docker network rm $NAME > /dev/null 2>&1
}


for TEST in *_app; do
  build $TEST
done

for TEST in *_app; do
  run_test $TEST
done
