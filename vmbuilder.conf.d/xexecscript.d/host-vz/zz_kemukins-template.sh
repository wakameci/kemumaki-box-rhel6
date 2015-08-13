#!/bin/bash
#
# requires:
#  bash
#
set -e

declare chroot_dir=$1

chroot $1 $SHELL -ex <<'EOS'
  until curl -fSkL -o /vz/template/cache/vz.kemumaki.x86_64.tar.gz http://dlc2.wakame.axsh.jp/wakameci/kemumaki-box-rhel6/current/vz.kemumaki.x86_64.tar.gz; do
    sleep 1
  done
EOS
