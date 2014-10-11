#!/bin/bash
#
# requires:
#  bash
#
set -e

. ./vmbuilder.conf

(
 cd rootfs
 time sudo tar zcpf ../vz.kemukins.`arch`.tar.gz .
)
