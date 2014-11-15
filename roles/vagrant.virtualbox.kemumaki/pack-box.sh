#!/bin/bash
#
# requires:
#  bash
#
set -e

. ./vmbuilder.conf

time tar zScvf kemumaki-${distro_ver}-x86_64.virtualbox.box box-disk1.raw
