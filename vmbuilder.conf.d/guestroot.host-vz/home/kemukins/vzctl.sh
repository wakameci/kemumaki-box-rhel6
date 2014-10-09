#!/bin/bash
#
# requires:
#  bash
#
set -e

function render_mount_script() {
  local ctid=${1:-101}

  cat <<'EOS'
#!/bin/bash
# This script source VPS configuration files in the same order as vzctl does

# if one of these files does not exist then something is really broken
[ -f /etc/vz/vz.conf ] || exit 1
[ -f $VE_CONFFILE ] || exit 1

# source both files. Note the order, it is important
. /etc/vz/vz.conf
. $VE_CONFFILE

# Configure veth with IP after VPS has started

NETIFLIST=$(printf %s "$NETIF" |tr ';' '\n')

if [ -z "${NETIFLIST}" ]; then
    # should be able to run CT without vifs
    echo "Warning: CT$VEID has no veth interface configured" 1>&2
    exit 0
fi

for iface in ${NETIFLIST}; do

    for str in $(printf %s "${iface}"|tr ',' '\n'); do
        case "${str}" in
            bridge=*|host_ifname=*)
            eval "${str%%=*}=\${str#*=}" ;;
        esac
    done

    if [ -z "${bridge}" ]; then
        echo "Error: bridge interfae does not exist" 1>&2
        exit 1
    fi

    {
        while sleep 1; do
            /sbin/ifconfig ${host_ifname} 0 > /dev/null 2>&1
            if [ $? -eq 0 ]; then
                brctl addif ${bridge} ${host_ifname}
                break
            fi
        done
    } &

done
EOS
}

function install_mount_script() {
  local ctid=${1:-101}
  local mount_script_path=/etc/vz/conf/${ctid}.mount

  render_mount_script  ${ctid} > ${mount_script_path}
  chmod 755 ${mount_script_path}
}

function render_ifcfg() {
  local ctid=${1:-101}

  cat <<EOS
DEVICE=eth0
TYPE=Ethernet
ONBOOT=yes
BOOTPROTO=static
BROADCAST=172.16.254.255
GATEWAY=172.16.254.1
IPADDR=172.16.254.${ctid}
NETMASK=255.255.255.0
MTU=1472
EOS
}

function install_ifcfg() {
  local ctid=${1:-101}
  local ifcfg_path=/vz/private/${ctid}/etc/sysconfig/network-scripts/ifcfg-eth0

  render_ifcfg ${ctid} > ${ifcfg_path}
  chmod 644 ${ifcfg_path}
}


## main

declare ctid=${1:-101}
declare ostemplate=${ostemplate:-vz.kemukins.x86_64}
declare ram=${ram:-$((128 * 8))M}
declare swap=${swap:-$((128 * 4))M}

vzctl create ${ctid} --ostemplate ${ostemplate} --layout simfs

vzctl set ${ctid} --netif_add eth0,,,,vzbr0 --save
vzctl set ${ctid} --nameserver 8.8.8.8      --save
vzctl set ${ctid} --hostname ct${ctid}.$(hostname) --save
vzctl set ${ctid} --diskspace 20G           --save
vzctl set ${ctid} --ram  ${ram}             --save
vzctl set ${ctid} --swap ${swap}            --save
vzctl set ${ctid} --devnodes fuse:rw        --save

install_mount_script ${ctid}
install_ifcfg        ${ctid}

vzctl start ${ctid}
