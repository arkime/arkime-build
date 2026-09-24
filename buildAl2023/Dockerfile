FROM amazonlinux:2023
MAINTAINER Andy Wick <awick@purple.org>
ARG ARKIME_BRANCH=main

RUN \
yum -y update && \
yum -y install --allowerasing curl git sudo perl-Test perl-Test-Simple bzip2 ruby-devel rubygems rpm-build pango which make python3-pip gcc gcc-c++ perl-Test-Harness && \
# pam_unix 1.5.x fails sudo's PAM account check under BuildKit on GitHub runners, easybutton needs sudo
echo 'Defaults !pam_acct_mgmt' >> /etc/sudoers && \
yum -y clean all && \
git clone https://github.com/arkime/arkime && \
(cd arkime; git checkout $ARKIME_BRANCH; ./easybutton-build.sh --thirdparty --kafka) && \
mv arkime/thirdparty / && \
rm -f /thirdparty/*/*.o /thirdparty/*/*/*.o && \
rm -rf arkime && \
gem install --no-document fpm && \
pip3 install awscli && \
yum -y clean all && \
rm -rf /var/cache/yum
