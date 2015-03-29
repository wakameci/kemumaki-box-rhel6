#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
set -x

mnt_path=${mnt_path:-$(pwd)/mnt}
# remove tail "/".
mnt_path=${mnt_path%/}
raw=${raw:-$(pwd)/box-disk1.raw}

##

kpartx_output=

function attach_raw() {
  local raw_path=$1

  kpartx_output="$(kpartx -va ${raw_path})"
  udevadm settle
}

function mount_raw() {
  local raw_path=$1 mnt_path=$2

  loopdev_root=$(echo "${kpartx_output}" | awk '{print $3}' | sed -n 1,1p) # loopXp1 should be "root".
  loopdev_swap=$(echo "${kpartx_output}" | awk '{print $3}' | sed -n 2,2p) # loopXp2 should be "swap".
  [[ -n "${loopdev_root}" ]]

  local devpath=/dev/mapper/${loopdev_root}
  trap "
   umount -f ${mnt_path}/dev
   umount -f ${mnt_path}/proc
   umount -f ${mnt_path}
  " ERR

  mkdir -p ${mnt_path}

  mount ${devpath}   ${mnt_path}
  mount --bind /proc ${mnt_path}/proc
  mount --bind /dev  ${mnt_path}/dev
}

function umount_raw() {
  local raw_path=$1 mnt_path=$2

  umount ${mnt_path}/dev
  umount ${mnt_path}/proc
  umount ${mnt_path}

  rmdir  ${mnt_path}
}

# remove DM and loop devices associated with the raw image.
function detach_raw() {
  local raw_path=$1

  kpartx -vd ${raw_path}

  local loop_path=
  for loop_path in $(losetup --associated ${raw_path} | awk -F\: '{print $1}'); do
    local loop_name=${loop_path#/dev/}
    # list and remove /dev/mapper dependants of the loop device.
    for dm in $(dmsetup deps | grep "${loop_name}p" | awk -F\: '{print $1}'); do
      dmsetup remove "/dev/mapper/${dm}"
      echo "Detached DM device: /dev/mapper/${dm}"
    done
    udevadm settle

    losetup -d $loop_path
    echo "Detached loop device: ${loop_path}"
  done
}

##

if ! [[ -f ${raw} ]]; then
  echo "[ERROR] No such file: ${raw}" >&2
  exit 1
fi

if ! [[ $UID == 0 ]]; then
  echo "[ERROR] Must run as root." >&2
  exit 1
fi

##

attach_raw ${raw}
mount_raw  ${raw} ${mnt_path}

{
chroot ${mnt_path} $SHELL -ex <<'EOS'
  rpm -qa --qf '%{INSTALLTIME} %{NAME} %{Version} %{Release}\n'
EOS
} | tee ${raw%%.raw}.rpm-qa

umount_raw ${raw} ${mnt_path}
detach_raw ${raw}
