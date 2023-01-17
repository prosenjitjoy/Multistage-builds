# Builder image
FROM docker.io/library/golang:latest
COPY hello_http/* /go/src/
WORKDIR /go/src/
RUN go get -d -v
RUN go build -v

# Runtime image
FROM registry.access.redhat.com/ubi9/ubi-micro:latest
COPY --from=0 /go/src/main /
EXPOSE 8080
CMD ["/main"]