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
EOS
