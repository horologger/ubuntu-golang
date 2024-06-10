#FROM ubuntu:latest
FROM ubuntu:22.04

ARG GO_VERSION
ENV GO_VERSION=${GO_VERSION}

ARG TARGETPLATFORM
ARG TARGETARCH
RUN echo "Building $TARGETPLATFORM with go version: $GO_VERSION"


#RUN apt-get update
#RUN apt-get install -y wget git gcc
RUN apt update && apt upgrade -y
RUN apt-get install -y wget git gcc make nodejs npm vim htop


RUN wget -P /tmp "https://dl.google.com/go/go${GO_VERSION}.linux-${TARGETARCH}.tar.gz"

RUN tar -C /usr/local -xzf "/tmp/go${GO_VERSION}.linux-${TARGETARCH}.tar.gz"
RUN rm "/tmp/go${GO_VERSION}.linux-${TARGETARCH}.tar.gz"

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

WORKDIR $GOPATH
