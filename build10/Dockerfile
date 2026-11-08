FROM almalinux:10
MAINTAINER Andy Wick <awick@purple.org>
ARG ARKIME_BRANCH=main

RUN \
yum -y update && \
dnf -y install 'dnf-command(config-manager)' && \
yum -y install --allowerasing curl git sudo perl-Test perl-Test-Simple bzip2 ruby-devel rubygems rpm-build pango which make python3-pip gcc gcc-c++ perl-Test-Harness && \
# pfring is x86_64 only
(cd /etc/yum.repos.d/; [ "$(uname -m)" != x86_64 ] || curl -sSfLO https://packages.ntop.org/centos/ntop.repo) && \
rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-10.noarch.rpm && \
/usr/bin/crb enable && \
yum -y clean all && \
([ "$(uname -m)" != x86_64 ] || yum -y install pfring) && \
git clone https://github.com/arkime/arkime && \
(cd arkime; git checkout $ARKIME_BRANCH; ./easybutton-build.sh --kafka) && \
rm -rf arkime && \
gem install --no-document fpm && \
pip3 install awscli && \
useradd -u 2000 elasticsearch && \
yum -y clean all && \
rm -rf /var/cache/yum

# The noes viewer tests keep the sessions in ClickHouse and the rest in Postgres
RUN yum -y install postgresql-server && \
yum -y clean all && \
rm -rf /var/cache/yum && \
cd /tmp && curl -sSfL https://clickhouse.com/ | sh && \
mv clickhouse /usr/local/bin/clickhouse && \
clickhouse --version

# The test data tests.pl would otherwise download every run, arkime's CI links it into tests/
RUN mkdir -p /arkime-test-data && cd /arkime-test-data && \
curl -sSfLO --retry 3 https://raw.githubusercontent.com/arkime/arkime-test-data/main/ipv4-address-space.csv && \
curl -sSfLO --retry 3 https://raw.githubusercontent.com/arkime/arkime-test-data/main/oui.txt && \
curl -sSfLO --retry 3 https://media.githubusercontent.com/media/arkime/arkime-test-data/main/GeoLite2-City.mmdb && \
curl -sSfLO --retry 3 https://raw.githubusercontent.com/arkime/arkime-test-data/main/GeoLite2-ASN.mmdb
