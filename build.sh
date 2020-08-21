#!/bin/bash

#docker login registry.hub.docker.com
#docker login docker.io

echo `date`"   ### Docker build and push"
docker build . -t jibijose/pillowfight:latest
#docker run -it jibijose/pillowfight:latest
docker push jibijose/pillowfight:latest
