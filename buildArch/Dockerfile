FROM --platform=linux/amd64 archlinux:latest
MAINTAINER Andy Wick <awick@purple.org>

RUN pacman-key --init
RUN pacman -Sy --noconfirm  archlinux-keyring  ca-certificates
RUN pacman -Syu --noconfirm gcc ruby ruby-rubygems make python-pip git perl-test-differences sudo wget gawk \
lua geoip yara file libpcap libmaxminddb libnet lua libtool autoconf gettext automake perl-http-message perl-lwp-protocol-https perl-json perl-socket6 openssh

RUN gem install --no-document fpm rexml

RUN useradd -u 2000 opensearch; \
(cd / ; \
 wget https://artifacts.opensearch.org/releases/core/opensearch/2.7.0/opensearch-min-2.7.0-linux-x64.tar.gz; \
 tar xf opensearch-min-2.7.0-linux-x64.tar.gz; \
 chown -R opensearch opensearch-2.7.0; \
 rm -f opensearch-min-2.7.0-linux-x64.tar.gz \
);
