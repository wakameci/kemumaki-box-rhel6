SHELL=/bin/bash

all:
	time sudo ../../vendor/vmbuilder/kvm/rhel/6/vmbuilder.sh --config-path ./vmbuilder.conf

run.sh:
	../../vendor/vmbuilder/kvm/rhel/6/misc/kvm-ctl.sh render-runscript --config-path ./vmbuilder.conf > $@
	chmod +x run.sh

.PHONY: run.sh
