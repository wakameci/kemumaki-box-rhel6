#!/bin/bash
#
# requires:
#  bash
#
set -e

function render_makefile() {
  local nodes="$@"

  cat <<-_HEAD_
	VMS=$(echo ${nodes})
	
	all:
	
	_HEAD_

  for node in ${nodes}; do
    echo "${node}:"
    printf "\t%s\n"  '(cd $@ && make)'
    echo
  done

  cat <<-'_FOOT_'
	.PHONY: $(VMS)
	_FOOT_
}

nodes=$(
 for i in *; do
   [[ -d $i ]] || continue
   echo $i
 done
)

render_makefile "${nodes}" | tee Makefile
