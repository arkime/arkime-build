FROM fedora:44
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
