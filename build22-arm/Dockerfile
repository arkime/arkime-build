FROM ubuntu:22.04
MAINTAINER Andy Wick <awick@purple.org>
ARG ARKIME_BRANCH=main

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
apt-get install -y curl lsb-release ruby-dev make python3-pip git libtest-differences-perl sudo apt-utils tzdata zstd && \
apt-get update && \
gem install --no-document fpm && \
pip3 install awscli && \
git clone https://github.com/arkime/arkime && \
(cd arkime; git checkout $ARKIME_BRANCH; ./easybutton-build.sh --nothirdparty --kafka) && \
rm -rf arkime && \
rm -rf /var/lib/apt/lists/*

# The test data tests.pl would otherwise download every run, arkime's CI links it into tests/
RUN mkdir -p /arkime-test-data && cd /arkime-test-data && \
curl -sSfLO --retry 3 https://raw.githubusercontent.com/arkime/arkime-test-data/main/ipv4-address-space.csv && \
curl -sSfLO --retry 3 https://raw.githubusercontent.com/arkime/arkime-test-data/main/oui.txt && \
curl -sSfLO --retry 3 https://media.githubusercontent.com/media/arkime/arkime-test-data/main/GeoLite2-City.mmdb && \
curl -sSfLO --retry 3 https://raw.githubusercontent.com/arkime/arkime-test-data/main/GeoLite2-ASN.mmdb
