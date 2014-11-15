#!/bin/bash
#
# requires:
#  bash
#
set -e

declare chroot_dir=$1

chroot $1 su - jenkins <<'EOS'
  until curl -fSkL -o /tmp/dot.rbenv.tar.gz http://dlc.wakame.axsh.jp/wakameci/kemumaki-box-rhel6/current/dot.rbenv.tar.gz; do
    sleep 1
  done

  tar zxf /tmp/dot.rbenv.tar.gz -C /var/lib/jenkins/
  rm /tmp/dot.rbenv.tar.gz
EOS
