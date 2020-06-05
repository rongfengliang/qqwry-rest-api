FROM golang:1.13-alpine AS build-env
WORKDIR /go/src/app
ENV  GO111MODULE=on
ENV  GOPROXY=https://goproxy.cn
COPY . .
RUN apk update && apk add git \
    && go build -o qqwry-rest

FROM alpine:latest
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
COPY --from=build-env /go/src/app/qqwry-rest .
COPY qqwry.dat .
EXPOSE 8080
ENTRYPOINT [ "./qqwry-rest" ]