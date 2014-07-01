SHELL=/bin/bash
NAME=`basename ${PWD}`

all:
	time sudo ../../vendor/vmbuilder/kvm/rhel/6/vmbuilder.sh --config-path ./vmbuilder.conf
	cd rootfs && sudo tar zcpf ../$(NAME).`arch`.tar.gz .
	sudo rm -rf rootfs
