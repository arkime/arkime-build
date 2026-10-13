FROM alpine:3.24
MAINTAINER Andy Wick <awick@purple.org>
ARG ARKIME_BRANCH=main

# apk packages are built with apk mkpkg, which needs scanelf from pax-utils
RUN apk add --no-cache bash sudo git curl perl make g++ linux-headers tzdata zstd python3-dev py3-pip docker-cli aws-cli pax-utils && \
git clone https://github.com/arkime/arkime && \
(cd arkime; git checkout $ARKIME_BRANCH; ./easybutton-build.sh --kafka) && \
rm -rf arkime
