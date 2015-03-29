#!/bin/bash
#
# requires:
#  bash
#
set -e

. ./vmbuilder.conf

sudo ../../helpers/list-installed-rpm.sh
time tar zScvf kemumaki-${distro_ver}-x86_64.virtualbox.box box-disk1.raw box-disk1.rpm-qa
