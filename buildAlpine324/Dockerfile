FROM alpine:3.24
MAINTAINER Andy Wick <awick@purple.org>
ARG ARKIME_BRANCH=main

# apk packages are built with apk mkpkg, which needs scanelf from pax-utils
RUN apk add --no-cache bash sudo git curl perl make g++ linux-headers tzdata zstd python3-dev py3-pip docker-cli aws-cli pax-utils && \
git clone https://github.com/arkime/arkime && \
(cd arkime; git checkout $ARKIME_BRANCH; ./easybutton-build.sh --kafka) && \
rm -rf arkime

# The test data tests.pl would otherwise download every run, arkime's CI links it into tests/
RUN mkdir -p /arkime-test-data && cd /arkime-test-data && \
curl -sSfLO --retry 3 https://raw.githubusercontent.com/arkime/arkime-test-data/main/ipv4-address-space.csv && \
curl -sSfLO --retry 3 https://raw.githubusercontent.com/arkime/arkime-test-data/main/oui.txt && \
curl -sSfLO --retry 3 https://media.githubusercontent.com/media/arkime/arkime-test-data/main/GeoLite2-City.mmdb && \
curl -sSfLO --retry 3 https://raw.githubusercontent.com/arkime/arkime-test-data/main/GeoLite2-ASN.mmdb
