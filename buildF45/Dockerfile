FROM fedora:45
MAINTAINER Andy Wick <awick@purple.org>
ARG ARKIME_BRANCH=main

RUN \
dnf -y update && \
dnf -y install git sudo perl-Test perl-Test-Simple bzip2 ruby-devel rubygems rpm-build pango which make python3-pip gcc gcc-c++ perl-Test-Harness libpcap-devel glib2-devel && \
dnf -y clean all && \
dnf -y install --allowerasing curl && \
git clone https://github.com/arkime/arkime && \
(cd arkime; git checkout $ARKIME_BRANCH; ./easybutton-build.sh --nothirdparty --kafka) && \
rm -rf arkime && \
gem install --no-document fpm && \
pip3 install awscli && \
useradd -u 2000 elasticsearch && \
dnf -y clean all && \
rm -rf /var/cache/dnf

# The test data tests.pl would otherwise download every run, arkime's CI links it into tests/
RUN mkdir -p /arkime-test-data && cd /arkime-test-data && \
curl -sSfLO --retry 3 https://raw.githubusercontent.com/arkime/arkime-test-data/main/ipv4-address-space.csv && \
curl -sSfLO --retry 3 https://raw.githubusercontent.com/arkime/arkime-test-data/main/oui.txt && \
curl -sSfLO --retry 3 https://media.githubusercontent.com/media/arkime/arkime-test-data/main/GeoLite2-City.mmdb && \
curl -sSfLO --retry 3 https://raw.githubusercontent.com/arkime/arkime-test-data/main/GeoLite2-ASN.mmdb
