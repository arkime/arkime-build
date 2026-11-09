FROM debian:trixie-slim
MAINTAINER Andy Wick <awick@purple.org>
ARG ARKIME_BRANCH=main

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
apt-get install -y curl lsb-release ruby-dev make python3-pip git libtest-differences-perl sudo apt-utils tzdata libnl-genl-3-dev docker.io zstd awscli && \
apt-get update && \
gem install --no-document fpm && \
git clone https://github.com/arkime/arkime && \
(cd arkime; git checkout $ARKIME_BRANCH; ./easybutton-build.sh --nothirdparty --kafka) && \
rm -rf arkime && \
rm -rf /var/lib/apt/lists/*

# Elasticsearch 9 for the es9 viewer tests, security off so no passwords
RUN useradd -u 2000 elasticsearch && \
(cd / && \
 curl -sSfL --retry 3 https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-9.5.6-linux-$(uname -m).tar.gz | tar xzf - && \
 mv elasticsearch-9.5.6 elasticsearch && \
 printf '%s\n' 'discovery.type: single-node' 'xpack.security.enabled: false' 'xpack.ml.enabled: false' 'ingest.geoip.downloader.enabled: false' 'cluster.routing.allocation.disk.threshold_enabled: false' >> elasticsearch/config/elasticsearch.yml && \
 chown -R elasticsearch elasticsearch \
)

# The test data tests.pl would otherwise download every run, arkime's CI links it into tests/
RUN mkdir -p /arkime-test-data && cd /arkime-test-data && \
curl -sSfLO --retry 3 https://raw.githubusercontent.com/arkime/arkime-test-data/main/ipv4-address-space.csv && \
curl -sSfLO --retry 3 https://raw.githubusercontent.com/arkime/arkime-test-data/main/oui.txt && \
curl -sSfLO --retry 3 https://media.githubusercontent.com/media/arkime/arkime-test-data/main/GeoLite2-City.mmdb && \
curl -sSfLO --retry 3 https://raw.githubusercontent.com/arkime/arkime-test-data/main/GeoLite2-ASN.mmdb
