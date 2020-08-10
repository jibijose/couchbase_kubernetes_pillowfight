#!/bin/bash

echo `date`"   ### Docker build and push"
docker build . -t registry.hub.docker.com/jibijose/pillowfight:latest
#docker run -it registry.hub.docker.com/jibijose/pillowfight:latest
docker push registry.hub.docker.com/jibijose/pillowfight:latest
