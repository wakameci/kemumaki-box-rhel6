#!/bin/bash
#
# requires:
#  bash
#
set -e

declare chroot_dir=$1

chroot $1 $SHELL -ex <<'EOS'
  addpkgs="
    yum-utils
    rpm-build
    mysql-server
    sqlite-devel
    mysql-devel
    make
    libpcap-devel
    git
    gcc
    createrepo
    automake
  "
  yum install -y --disablerepo=updates ${addpkgs}

  rpm -qa epel-release* | egrep -q epel-release || { sudo rpm -Uvh http://dlc.wakame.axsh.jp.s3-website-us-east-1.amazonaws.com/epel-release; }
EOS
