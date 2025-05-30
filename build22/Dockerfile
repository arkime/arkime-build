FROM ubuntu:22.04
MAINTAINER Andy Wick <awick@purple.org>
ARG ARKIME_BRANCH=main

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
apt-get install -y lsb-release ruby-dev make git libtest-differences-perl sudo wget apt-utils tzdata apt-utils software-properties-common gnupg && \
(cd /tmp && wget https://packages.ntop.org/apt-stable/22.04/all/apt-ntop-stable.deb && apt install -y ./apt-ntop-stable.deb) && \
wget https://apt.llvm.org/llvm.sh && \
apt-get update && \
apt-get install -y pfring && \
gem install --no-document fpm && \
bash llvm.sh 18 && \
git clone https://github.com/arkime/arkime && \
(cd arkime; git checkout $ARKIME_BRANCH; ./easybutton-build.sh --nothirdparty --kafka) && \
rm -rf arkime && \
rm -rf /var/lib/apt/lists/*

RUN useradd -u 2000 opensearch; \
(cd / ; \
 wget https://artifacts.opensearch.org/releases/core/opensearch/2.7.0/opensearch-min-2.7.0-linux-x64.tar.gz; \
 tar xf opensearch-min-2.7.0-linux-x64.tar.gz; \
 chown -R opensearch opensearch-2.7.0; \
 rm -f opensearch-min-2.7.0-linux-x64.tar.gz \
);
