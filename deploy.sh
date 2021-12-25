
# TODO - env variables

docker build -t amirl1086/complex-client:latest -t amirl1086/complex-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t amirl1086/complex-server:latest -t amirl1086/complex-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t amirl1086/complex-worker:latest -t amirl1086/complex-worker:$GIT_SHA -f ./worker/Dockerfile ./worker

docker push amirl1086/complex-client:latest
docker push amirl1086/complex-client:$GIT_SHA
docker push amirl1086/complex-server:latest
docker push amirl1086/complex-server:$GIT_SHA
docker push amirl1086/complex-worker:latest
docker push amirl1086/complex-worker:$GIT_SHA

# possible to replace the images in the config files before
kubectl apply -f ./orchestration
kubectl set image deploymet/client-deploymet client=amirl1086/complex-client:$GIT_SHA
kubectl set image deploymet/server-deploymet server=amirl1086/complex-server:$GIT_SHA
kubectl set image deploymet/worker-deploymet worker=amirl1086/complex-worker:$GIT_SHA