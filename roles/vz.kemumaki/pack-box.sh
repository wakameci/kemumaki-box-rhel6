#!/bin/bash
#
# requires:
#  bash
#
set -e

. ./vmbuilder.conf

output_name=vz.kemumaki.`arch`

mnt_path=rootfs
{
sudo \
chroot ${mnt_path} $SHELL -ex <<'EOS'
  rpm -qa --qf '%{INSTALLTIME} %{NAME} %{Version} %{Release}\n'
EOS
} | tee ${output_name}.rpm-qa

(
 cd rootfs
 time sudo tar zcpf ../${output_name}.tar.gz .
)
