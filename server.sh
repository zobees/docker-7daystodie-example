#!/usr/bin/env bash

BASEDIR=$(cd $(dirname $0) && pwd)
NAME=7daystodie-example
DATA=$BASEDIR/data
PORTS="26900-26902:26900-26902"

case $1 in
  build)
    echo "Building image.." >&2
    docker build --rm -t $NAME .
    ;;
  rebuild)
    echo "Removing old image.." >&2
    docker rmi $NAME
    echo "Building new image.." >&2
    docker build --rm -t $NAME .
    ;;
  start)
    if [ -n "$(docker ps -aq -f name=$NAME -f status=running)" ]; then
      echo "Server is already running!" >&2
      exit 1
    fi

    if [ -n "$(docker ps -aq -f name=$NAME -f status=exited)" ]; then
      echo "Removing old container.." >&2
      docker rm $NAME
    fi

    echo "Starting container.." >&2
    docker run -d -i -t --restart=always --name $NAME -p $PORTS -p $PORTS/udp -v $DATA:/data $NAME
    ;;
  stop)
    echo "Stopping container.." >&2
    docker stop $NAME
    ;;
  status)
    docker ps -aq -f name=$NAME --format "{{.Names}}: {{.Status}}"
    ;;
  logs)
    docker logs -f $NAME
    ;;
  *)
    echo "Usage: $0 <build|rebuild|start|stop|status|logs>" >&2
    ;;
esac
