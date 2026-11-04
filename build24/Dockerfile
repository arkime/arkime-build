FROM ubuntu:24.04
MAINTAINER Andy Wick <awick@purple.org>
ARG ARKIME_BRANCH=main

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
apt-get install -y lsb-release ruby-dev make python3-pip git libtest-differences-perl sudo apt-utils tzdata libnl-genl-3-dev zstd curl && \
apt-get update && \
gem install --no-document fpm && \
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
unzip awscliv2.zip && \
./aws/install && \
rm -rf aws* && \
git clone https://github.com/arkime/arkime && \
(cd arkime; git checkout $ARKIME_BRANCH; ./easybutton-build.sh --nothirdparty --kafka) && \
useradd -u 2000 opensearch && \
(cd / ; \
 curl -sSfLO https://artifacts.opensearch.org/releases/core/opensearch/2.7.0/opensearch-min-2.7.0-linux-x64.tar.gz; \
 tar xf opensearch-min-2.7.0-linux-x64.tar.gz; \
 chown -R opensearch opensearch-2.7.0; \
 rm -f opensearch-min-2.7.0-linux-x64.tar.gz \
) && \
rm -rf arkime && \
rm -rf /var/lib/apt/lists/*

# The test data tests.pl would otherwise download every run, arkime's CI links it into tests/
RUN mkdir -p /arkime-test-data && cd /arkime-test-data && \
curl -sSfLO --retry 3 https://raw.githubusercontent.com/arkime/arkime-test-data/main/ipv4-address-space.csv && \
curl -sSfLO --retry 3 https://raw.githubusercontent.com/arkime/arkime-test-data/main/oui.txt && \
curl -sSfLO --retry 3 https://media.githubusercontent.com/media/arkime/arkime-test-data/main/GeoLite2-City.mmdb && \
curl -sSfLO --retry 3 https://raw.githubusercontent.com/arkime/arkime-test-data/main/GeoLite2-ASN.mmdb
