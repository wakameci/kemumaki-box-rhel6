#!/bin/bash
#
# requires:
#  bash
#
set -e

. ./vmbuilder.conf

(
 cd rootfs
 time sudo tar zcpf ../vz.kemumaki.`arch`.tar.gz .
)
