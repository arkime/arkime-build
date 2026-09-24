FROM almalinux:9
MAINTAINER Andy Wick <awick@purple.org>
ARG ARKIME_BRANCH=main

RUN \
yum -y update && \
dnf -y install 'dnf-command(config-manager)' && \
yum -y install --allowerasing curl git sudo perl-Test perl-Test-Simple bzip2 ruby-devel rubygems rpm-build pango which make python3-pip gcc gcc-c++ perl-Test-Harness libubsan libasan && \
# pam_unix 1.5.x fails sudo's PAM account check under BuildKit on GitHub runners, easybutton needs sudo
echo 'Defaults !pam_acct_mgmt' >> /etc/sudoers && \
(cd /etc/yum.repos.d/; curl -sSfLO https://packages.ntop.org/centos/ntop.repo) && \
rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm && \
/usr/bin/crb enable && \
yum -y clean all && \
yum -y install pfring && \
git clone https://github.com/arkime/arkime && \
(cd arkime; git checkout $ARKIME_BRANCH; ./easybutton-build.sh --pfring --kafka) && \
rm -rf arkime && \
gem install --no-document fpm && \
pip3 install awscli && \
useradd -u 2000 elasticsearch && \
yum -y clean all && \
rm -rf /var/cache/yum
