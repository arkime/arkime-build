FROM amazonlinux:2023
MAINTAINER Andy Wick <andy.wick@oath.com>
ARG ARKIME_BRANCH=main

RUN \
yum -y update && \
yum -y install git sudo perl-Test perl-Test-Simple bzip2 wget ruby-devel rubygems rpm-build pango which make python3-pip gcc gcc-c++ perl-Test-Harness && \
yum -y clean all && \
yum -y install --allowerasing curl && \
git clone https://github.com/arkime/arkime && \
(cd arkime; git checkout $ARKIME_BRANCH; ./easybutton-build.sh --kafka) && \
mv arkime/thirdparty / && \
rm -f /thirdparty/*/*.o /thirdparty/*/*/*.o && \
rm -rf arkime && \
gem install --no-document fpm && \
pip3 install awscli && \
yum -y clean all && \
rm -rf /var/cache/yum
