FROM golang:1.10.3-alpine

RUN apk add --update curl bash make openssh-client git mercurial mysql-client \
    && rm -rf /var/cache/apk/*

RUN ln -s /usr/include/locale.h /usr/include/xlocale.h

RUN curl -L https://github.com/golang/dep/releases/download/v0.4.1/dep-linux-amd64 -o /usr/bin/dep \
  && chmod +x /usr/bin/dep \
  && go get -v \
      github.com/golang/lint/golint \
      golang.org/x/tools/cmd/cover \
      github.com/modocache/gover \
      github.com/stretchr/testify \
      gopkg.in/matm/v1/gocov-html \
      github.com/axw/gocov/gocov \
  && rm -rf ${GOPATH}/pkg/*
