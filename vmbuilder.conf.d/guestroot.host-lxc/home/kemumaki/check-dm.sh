#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
set -x

raw=${1:-"blank.raw"}
disk_size=${disk_size:-1024}

[[ ${UID} == 0 ]]

# -1
dmsetup ls
udevadm settle

# 0
truncate -s ${disk_size}m ${raw}

# 1
parted --script ${raw} -- mklabel msdos
parted --script ${raw} -- unit s print

# 2
#parted --script ${raw} -- mkpart primary ext2 63s -1
parted --script ${raw} -- mkpart primary ext2 63s -0
parted --script ${raw} -- unit s print

# 3
output=$(kpartx -va ${raw})
loopdev_root=$(echo "${output}" | awk '{print $3}' | sed -n 1,1p) # loopXp1 should be "root".
#loopdev_swap=$(echo "${output}" | awk '{print $3}' | sed -n 2,2p) # loopXp2 should be "swap".
udevadm settle

mkfs.ext4 -F -E lazy_itable_init=1 /dev/mapper/${loopdev_root}
mkdir -p mnt
mount /dev/mapper/${loopdev_root} mnt
df -k
df -m
df -h
umount mnt
rmdir mnt

# 4
kpartx -vl ${raw}
kpartx -vd ${raw}

# 5
function detach_partition() {
  local loopdev=${1}
  [[ -n "${loopdev}" ]] || return 0

  if dmsetup info ${loopdev} 2>/dev/null | egrep ^State: | egrep -w ACTIVE -q; then
    dmsetup remove ${loopdev}
  fi

  local loopdev_path=/dev/${loopdev%p[0-9]*}
  if losetup -a | egrep ^${loopdev_path}: -q; then
    losetup -d ${loopdev_path}
  fi
}

detach_partition ${loopdev_root}
#detach_partition ${loopdev_swap}

# 6
rm -f ${raw}
