#!/bin/bash

echo "Define builder and runtime images"
BUILDER=docker.io/library/golang:latest
RUNTIME=docker.io/library/debian:bookworm-slim

echo "Create builder container"
container1=$(buildah from $BUILDER)

echo "Copy files from host"
if ([ -f ./hello_http/go.mod ]  &&  [ -f ./hello_http/main.go ]); then
  buildah copy $container1 './hello_http/go.mod' '/go/src/'
  buildah copy $container1 './hello_http/main.go' '/go/src/'
else
  echo "Source files do not exist."
  exit 1
fi

echo "Configure and start build"
buildah config --workingdir /go/src $container1
buildah run $container1 go install -v
buildah run $container1 go build -v

echo "Create runtime container"
container2=$(buildah from $RUNTIME)

echo "Copy files from the builder container"
buildah copy --from=$container1 $container2 '/go/src/main' '/'

echo "Configure exposed ports"
buildah config --port 8080 $container2

echo "Configure default CMD"
buildah config --cmd /main $container2

echo "Commit final image"
buildah commit $container2 multistage-buildah

echo "Remove build containers"
buildah rm $container1 $container2