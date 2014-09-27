#!/bin/bash
#
# requires:
#  bash
#
set -e

declare chroot_dir=$1

chroot $1 $SHELL -ex <<'EOS'
  until curl -fSkL -o /vz/template/cache/vz.kemukins.x86_64.tar.gz http://dlc.wakame.axsh.jp/wakameci/kemukins-box-rhel6/current/vz.kemukins.x86_64.tar.gz; do
    sleep 1
  done
EOS
