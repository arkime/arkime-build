FROM amazonlinux:2027
MAINTAINER Andy Wick <awick@purple.org>
ARG ARKIME_BRANCH=main

# AL2027 differences from AL2023:
#  - ruby is only packaged as ruby3.4*, there is no plain ruby-devel/rubygems
#  - python is 3.14 with no python3-pip awscli v1 support, use the awscli v2 installer
#  - still no yara, librdkafka, libxdp or daq packages, so easybutton builds yara and librdkafka
#  - gcc 16
RUN \
yum -y update && \
yum -y install curl git sudo perl-Test perl-Test-Simple bzip2 ruby3.4 ruby3.4-devel rpm-build pango which make python3-devel python3-pip gcc gcc-c++ perl-Test-Harness unzip && \
yum -y clean all && \
yum -y install --allowerasing curl && \
git clone https://github.com/arkime/arkime && \
(cd arkime; git checkout $ARKIME_BRANCH; ./easybutton-build.sh --thirdparty --kafka) && \
mv arkime/thirdparty / && \
rm -f /thirdparty/*/*.o /thirdparty/*/*/*.o && \
rm -rf arkime && \
gem install --no-document fpm && \
curl -sSfL "https://awscli.amazonaws.com/awscli-exe-linux-$(uname -m).zip" -o awscliv2.zip && \
unzip -q awscliv2.zip && ./aws/install && rm -rf aws awscliv2.zip && \
yum -y clean all && \
rm -rf /var/cache/yum
