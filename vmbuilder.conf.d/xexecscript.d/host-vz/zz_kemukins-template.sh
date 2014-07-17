#!/bin/bash
#
# requires:
#  bash
#
set -e

declare chroot_dir=$1

chroot $1 $SHELL -ex <<'EOS'
  until curl -fsSkL -o /vz/template/cache/vz.kemukins.x86_64.tar.gz http://dlc.wakame.axsh.jp/openvz/wakameci/vz.kemukins.x86_64.tar.gz; do
    sleep 1
  done
EOS
