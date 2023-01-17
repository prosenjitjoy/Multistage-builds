# Multistage-builds---Dockerfiles
Building a demo OCI container image to learn multistage build with dockerfile.
### Multistage container builds solves the problem of size of the images.  
Let's say we want to leverage the benefits of the standardized environment (Containers) for runtime/compiler to build an app instead of a local machine. But if we want to ship an app to production, the size of the images matters. Say for golang binary, which is statically linked, doesn't need any compiler or dependency to run on production. So, we can use another light and secure base image(alpine, ub9-micro) to reduce final container size. There come the benefits of multistage container builds with dockerfile.
