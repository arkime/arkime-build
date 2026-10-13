FROM alpine:3.24
MAINTAINER Andy Wick <awick@purple.org>
ARG ARKIME_BRANCH=main

RUN apk add --no-cache bash sudo git curl perl make g++ linux-headers tzdata zstd ruby ruby-dev python3-dev py3-pip docker-cli aws-cli nfpm && \
gem install --no-document fpm && \
git clone https://github.com/arkime/arkime && \
(cd arkime; git checkout $ARKIME_BRANCH; ./easybutton-build.sh --kafka) && \
rm -rf arkime
