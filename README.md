# Multistage-builds

Building a demo OCI container image to learn multistage build with dockerfile and buildah script.
### Multistage container builds solves the problem of size of the images.  
Let's say we want to leverage the benefits of the standardized environment (Containers) for runtime/compiler to build an app instead of a local machine. But if we want to ship an app to production, the size of the images matters. Say for golang binary, which is statically linked, doesn't need any compiler or dependency to run on production. So, we can use another light and secure base image (alpine:latest, debian:stable-slim, ub9-micro:latest) to reduce final runtime container size.

## With Dockerfile
### Build Command
```podman
{docker/podman/buildah} build -t {tagname} .
```
## With buildah
```
chmod +x ./multistage-buildah.sh 
./multistage-buildah.sh 
```
