#!/bin/bash

docker build -t $DOCKER_USERNAME/complex-client:latest -t $DOCKER_USERNAME/complex-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t $DOCKER_USERNAME/complex-server:latest -t $DOCKER_USERNAME/complex-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t $DOCKER_USERNAME/complex-worker:latest -t $DOCKER_USERNAME/complex-worker:$GIT_SHA -f ./worker/Dockerfile ./worker

docker push $DOCKER_USERNAME/complex-client:latest
docker push $DOCKER_USERNAME/complex-client:$GIT_SHA
docker push $DOCKER_USERNAME/complex-server:latest
docker push $DOCKER_USERNAME/complex-server:$GIT_SHA
docker push $DOCKER_USERNAME/complex-worker:latest
docker push $DOCKER_USERNAME/complex-worker:$GIT_SHA

# possible to replace the images in the config files before
kubectl apply -f ./orchestration
kubectl set image deploymet/client-deploymet client=$DOCKER_USERNAME/complex-client:$GIT_SHA
kubectl set image deploymet/server-deploymet server=$DOCKER_USERNAME/complex-server:$GIT_SHA
kubectl set image deploymet/worker-deploymet worker=$DOCKER_USERNAME/complex-worker:$GIT_SHA