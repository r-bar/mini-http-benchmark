#!/bin/sh
BUILD_DIR=build


cleanup() {
  for TEST in *_app; do
    docker rm -f $TEST
  done
}
trap cleanup EXIT


build() {
  docker build $1 -t $1 || exit 1
}


run_test() {
  NAME=$1
  echo Starting test for $NAME
  CONTAINER=`docker run -d -p 8000:80 --name $NAME $NAME`
  if [ -z $CONTAINER ]; then
    exit 1
  fi
  echo Cmd: `docker inspect $CONTAINER | jq -r '.[0].Config.Cmd | join(" ")'`
  sleep 1
  ab -c 1000 -n 10000 http://localhost:8000/
  if [ $? -gt 0 ]; then
    echo Test failed...
    docker logs $CONTAINER
    #exit 1
  fi
  docker rm -f $CONTAINER
}

for TEST in *_app; do
  build $TEST
done

for TEST in *_app; do
  run_test $TEST
done
