#!/bin/bash
#
# requires:
#  bash
#
set -e

declare chroot_dir=$1

chroot $1 $SHELL -ex <<'EOS'
  mkdir -p /lxc/template/cache

  until curl -fSkL -o /lxc/template/cache/vz.kemukins.x86_64.tar.gz http://dlc.wakame.axsh.jp/wakameci/kemukins-box-rhel6/current/vz.kemukins.x86_64.tar.gz; do
    sleep 1
  done
EOS
