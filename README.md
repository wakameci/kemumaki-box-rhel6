kemumaki-box-rhel6
==================

Kemumaki build environment provides rpmbuild and vmimage file build.

General
-------

+ [OS](vmbuilder.conf#L5-L6)
  + CentOS-6.3 x86_64
  + CentOS-6.4 x86_64
  + CentOS-6.5 x86_64
  + CentOS-6.6 x86_64
+ Disk
  + [rootfs: 40 GB](vmbuilder.conf.d/disk.conf#L1)
  + [swap: 1 GB](vmbuilder.conf.d/disk.conf#L2)

Accounts
--------

| username | password |
|:---------|:---------|
| root     | (locked) |
| kemumaki | kemumaki |

Current Boxes
-------------

KVM Guests:

+ kemumaki-6.4-x86_64.kvm.box
+ kemumaki-6.5-x86_64.kvm.box
+ kemumaki-6.6-x86_64.kvm.box
+ minimal-6.3-x86_64.kvm.box
+ minimal-6.4-x86_64.kvm.box
+ minimal-6.5-x86_64.kvm.box
+ minimal-6.6-x86_64.kvm.box
+ vzkemumaki-6.6-x86_64.kvm.box
+ lxckemumaki-6.6-x86_64.kvm.box

OpenVZ Container(s):

+ vz.kemumaki.x86_64.tar.gz (on vzkemumaki-6.6-x86_64)

Linux Container(s):

+ vz.kemumaki.x86_64.tar.gz (on lxckemumaki-6.6-x86_64)

Build Environment
-----------------

### CI tool

+ [jenkins](http://jenkins-ci.org/)
   + java-1.6.0-openjdk
   + dejavu-sans-fonts
+ jenkins plugins
   + PrioritySorter 1.3
   + config-autorefresh-plugin
   + configurationslicing
   + config-file-provider
   + cron_column
   + downstream-buildview
   + git        1.4.0
   + git-client 1.1.1
   + hipchat 0.1.5
   + greenballs
   + managed-scripts 1.1
   + nested-view
   + next-executions
   + parameterized-trigger 2.18
   + rebuild 1.20
   + timestamper 1.5.6
   + token-macro
   + urltrigger
   + view-job-filters

### SCM tool

+ git

### Compilers &amp; RPM/Yum build tools

+ make
+ gcc
+ gcc-c++
+ rpm-build
+ automake
+ createrepo
+ openssl-devel
+ zlib-devel
+ kernel-devel
+ perl

### Ruby build tools

+ readline-devel
+ libyaml
+ libyaml-devel

### VM image build tools

+ qemu-kvm
+ qemu-img
+ parted
+ kpartx
+ zip
+ tar

### Networking tools

+ ntp
+ ntpdate
+ rsync
+ nmap
+ tcpdump
+ traceroute
+ telnet
+ bind-utils
+ nc
+ wireshark
+ s3cmd

### Debugging/Development tools

+ man
+ sysstat
+ ltrace
+ lsof
+ strace
+ sudo
+ vim-minimal
+ screen

### RSpec &amp; FPM for Wakame-vdc &amp; OpenVNet

+ yum-utils
+ mysql-server
+ sqlite-devel
+ mysql-devel
+ chrpath
+ rpmdevtools
+ epel-release

Links
-----

+ [buidbook-rhel6](https://github.com/wakameci/buildbook-rhel6)
+ [vmbuider](https://github.com/hansode/vmbuilder)
