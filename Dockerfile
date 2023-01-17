# Builder image
FROM docker.io/library/golang AS builder
COPY hello_http/* /go/src/
WORKDIR /go/src/
RUN go get -d -v
RUN go build -v

# Runtime image
FROM docker.io/redhat/ubi9-micro AS server
COPY --from=builder /go/src/main /
EXPOSE 8080
CMD ["/main"]