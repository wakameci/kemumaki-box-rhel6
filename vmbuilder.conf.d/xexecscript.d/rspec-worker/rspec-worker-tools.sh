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

    chrpath
    rpmdevtools
  "
  yum install -y --disablerepo=updates ${addpkgs}

  rpm -qa epel-release* | egrep -q epel-release || {
    rpm -Uvh http://dlc.wakame.axsh.jp.s3-website-us-east-1.amazonaws.com/epel-release

    # in order escape below error
    # > Error: Cannot retrieve metalink for repository: epel. Please verify its path and try again
    yum install -y ca-certificates
  }
EOS
