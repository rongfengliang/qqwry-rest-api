FROM golang:1.13-alpine AS build-env
WORKDIR /go/src/app
COPY . .

RUN apk update && apk add git \
    && go build -o qqwryapp

FROM alpine:latest
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
COPY --from=build-env /go/src/app/qqwryapp .
COPY qqwry.dat .
EXPOSE 8080
ENTRYPOINT [ "./qqwryapp" ]