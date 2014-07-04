kemukins-box-rhel6
==================

Kemukins build environment provides rpmbuild and vmimage file build.

General
-------

+ OS: CentOS-6.5 x86_64
+ Disk: 40 GB

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

### VM image build tools

+ qemu-kvm
+ qemu-img
+ parted
+ kpartx
+ zip

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

### Debugging/Development tools

+ man
+ sysstat
+ ltrace
+ lsof
+ strace
+ sudo
+ vim-minimal
+ screen

Links
-----

+ [buildshelf-rhel6-setup](https://github.com/hansode/buildshelf-rhel6-setup)
+ [buidbook-rhel6](https://github.com/hansode/buildbook-rhel6)
+ [vmbuider](https://github.com/hansode/vmbuilder)
