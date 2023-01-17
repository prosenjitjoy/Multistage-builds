# Multistage-builds---Dockerfiles
Multistage container builds solves the problem of size of the images.  
  
Let's say we want to leverage the benefits of the standardized environment (Containers) for runtime/compiler to build an app instead of a local machine. But if we want to ship an app to production, the size of the images matters. Both in terms of resources and security. So we need another light and secure base image(alpine, ub9-micro) for production containers. There come the benefits of multistage container builds with dockerfile.
