#!/bin/bash
#
# requires:
#  bash
#
set -e

. ./vmbuilder.conf

time tar zScvf lxckemumaki-${distro_ver}-x86_64.kvm.box box-disk1.raw
