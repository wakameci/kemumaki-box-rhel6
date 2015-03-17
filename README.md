kemumaki-box-rhel6
==================

Kemumaki build environment provides rpmbuild and vmimage file build.

Usage
-----

Setup submodule(s).

```
$ make
```

Select flavor of vmimage.

```
$ cd roles
$ ls
kvm.kemumaki  kvm.lxckemumaki  kvm.minimal
$ cd kvm.minimal
```

Create vmimage.

```
$ sudo make
```

Generate box file.

```
$ sudo ./pack-box.sh
```

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
+ kagechiyo-6.6-x86_64.kvm.box

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
   + [PrioritySorter](https://wiki.jenkins-ci.org/display/JENKINS/Priority+Sorter+Plugin)
   + [config-autorefresh-plugin](https://wiki.jenkins-ci.org/display/JENKINS/Config+AutoRefresh+Plugin)
   + [config-file-provider](https://wiki.jenkins-ci.org/display/JENKINS/Config+File+Provider+Plugin)
   + [configurationslicing](https://wiki.jenkins-ci.org/display/JENKINS/Configuration+Slicing+Plugin)
   + [cron_column](https://wiki.jenkins-ci.org/display/JENKINS/Cron+Column+Plugin)
   + [downstream-buildview](https://wiki.jenkins-ci.org/display/JENKINS/Downstream+buildview+plugin)
   + [git](https://wiki.jenkins-ci.org/display/JENKINS/Git+Plugin)        1.4.0
   + [git-client](https://wiki.jenkins-ci.org/display/JENKINS/Git+Client+Plugin) 1.1.1
   + [github-api](https://wiki.jenkins-ci.org/display/JENKINS/GitHub+API+Plugin)
   + [github-oauth](https://wiki.jenkins-ci.org/display/JENKINS/Github+OAuth+Plugin)
   + [greenballs](https://wiki.jenkins-ci.org/display/JENKINS/Green+Balls)
   + [hipchat](https://wiki.jenkins-ci.org/display/JENKINS/HipChat+Plugin)
   + [managed-scripts](https://wiki.jenkins-ci.org/display/JENKINS/Managed+Script+Plugin)
   + [nested-view](https://wiki.jenkins-ci.org/display/JENKINS/Nested+View+Plugin)
   + [next-executions](https://wiki.jenkins-ci.org/display/JENKINS/Next+Executions)
   + [parameterized-trigger](https://wiki.jenkins-ci.org/display/JENKINS/Parameterized+Trigger+Plugin)
   + [rbenv](https://wiki.jenkins-ci.org/display/JENKINS/Rbenv+Plugin)
   + [rebuild](https://wiki.jenkins-ci.org/display/JENKINS/Rebuild+Plugin)
   + [timestamper](https://wiki.jenkins-ci.org/display/JENKINS/Timestamper)
   + [token-macro](https://wiki.jenkins-ci.org/display/JENKINS/Token+Macro+Plugin)
   + [urltrigger](https://wiki.jenkins-ci.org/display/JENKINS/URLTrigger+Plugin)
   + [view-job-filters](https://wiki.jenkins-ci.org/display/JENKINS/View+Job+Filters)

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
+ iperf3

### Debugging/Development tools

+ man
+ sysstat
+ ltrace
+ lsof
+ strace
+ sudo
+ vim-minimal
+ screen
+ sysdig

### RSpec &amp; FPM for Wakame-vdc &amp; OpenVNet

+ yum-utils
+ mysql-server
+ sqlite-devel
+ mysql-devel
+ chrpath
+ rpmdevtools
+ epel-release

## HashiCorp tools

+ [serf](https://serfdom.io/)
+ [consul](https://consul.io/)

Links
-----

+ [buildbook-rhel7](https://github.com/wakameci/buildbook-rhel7)
+ [vmbuider](https://github.com/hansode/vmbuilder)
