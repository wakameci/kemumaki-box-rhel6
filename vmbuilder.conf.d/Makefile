SHELL=/bin/bash

all:

build:
	time sudo ../../vendor/vmbuilder/kvm/rhel/6/vmbuilder.sh --config-path ./vmbuilder.conf

clean:
	@rm -f box-disk1.*

box-disk1.vmdk:
	time ../../vendor/vmbuilder/kvm/rhel/6/misc/raw2vmdk.sh box-disk1.raw

run.sh:
	../../vendor/vmbuilder/kvm/rhel/6/misc/kvm-ctl.sh render-runscript --config-path ./vmbuilder.conf > $@
	chmod +x run.sh

.PHONY: run.sh
