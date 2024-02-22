#!/bin/bash
NAME="wallneradam/docker-flatcar-toolbox-ubuntu"
VERSION="0.1.2"

docker build --rm --no-cache -t ${NAME}:${VERSION} -t ${NAME}:latest . \
   && docker push ${NAME}:${VERSION} \
   && docker push ${NAME}:latest
