#!/bin/bash
#
# requires:
#  bash
#
set -e

declare chroot_dir=$1

chroot $1 $SHELL -ex <<'EOS'
  egrep ^cgroup /etc/fstab || { echo "cgroup /cgroup cgroup defaults 0 0" >> /etc/fstab; }
EOS
