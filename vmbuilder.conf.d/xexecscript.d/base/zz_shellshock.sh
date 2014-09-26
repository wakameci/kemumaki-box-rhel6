#!/bin/bash
#
# requires:
#  bash
#
set -e

declare chroot_dir=$1

chroot $1 $SHELL -ex <<'EOS'
  releasever=$(< /etc/yum/vars/releasever)

  case "${releasever}" in
    6.5) yum update  -y bash ;;
      *) yum install -y http://ftp.riken.jp/pub/Linux/centos/6/updates/x86_64/Packages/bash-4.1.2-15.el6_5.2.x86_64.rpm ;;
  esac
EOS
