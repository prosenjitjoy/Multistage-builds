# Builder image
FROM docker.io/library/golang:latest
COPY hello_http/* /go/src/
WORKDIR /go/src/
RUN go get -d -v
RUN go build -v

# Runtime image
FROM docker.io/redhat/ubi9-micro:latest
COPY --from=0 /go/src/main /
EXPOSE 8080
CMD ["/main"]