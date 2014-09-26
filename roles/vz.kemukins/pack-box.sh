#!/bin/bash
#
# requires:
#  bash
#
set -e

. ./vmbuilder.conf

(
 cd rootfs
 time sudo tar zcvpf ../vz.kemukins.`arch`.tar.gz .
)
