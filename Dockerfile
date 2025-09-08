FROM golang:latest AS build

RUN go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest
RUN xcaddy build --with github.com/aksdb/caddy-cgi@v2.2.6

FROM alpine:latest AS base

COPY --from=build /go/caddy /usr/bin/caddy
# RUN apk add git git-gitweb gcc libc-dev make perl-dev perl-app-cpanminus
# RUN cpanm CGI

RUN apk add git git-gitweb perl-cgi

COPY Caddyfile /etc/caddy/Caddyfile
COPY gitweb.conf /etc/gitweb.conf

VOLUME /pub/git

