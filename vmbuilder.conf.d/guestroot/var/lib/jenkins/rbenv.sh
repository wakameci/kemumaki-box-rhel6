#!/bin/bash
#
# requires:
#  bash
#  git
#
set -e
set -o pipefail
set -x

LANG=C
LC_ALL=C

#

function setup_rbenv() {
  if ! [[ -d ${HOME}/.rbenv ]]; then
    git clone https://github.com/sstephenson/rbenv.git ${HOME}/.rbenv
  fi
  cd ${HOME}/.rbenv
  git checkout master
  git pull
}

function setup_rubybuild() {
  if ! [[ -d ${HOME}/.rbenv/plugins/ruby-build ]]; then
    git clone https://github.com/sstephenson/ruby-build.git ${HOME}/.rbenv/plugins/ruby-build
  fi
  cd ${HOME}/.rbenv/plugins/ruby-build
  git checkout master
  git pull
}

function rbenv() {
  env RBENV_ROOT=${HOME}/.rbenv RBENV_VERSION=${RBENV_VERSION} ${HOME}/.rbenv/bin/rbenv ${@}
}

function install_ruby() {
  local RBENV_VERSION=${1}
  [[ -n "${RBENV_VERSION}" ]] || { echo "RBENV_VERSION is empty." >&2; return 1; }

  setup_rbenv
  setup_rubybuild

  rbenv local 2>/dev/null || :

  mkdir ${HOME}/.rbenv.lock

  rbenv versions --bare
  if ! [[ -d /var/lib/jenkins/.rbenv/versions/${RBENV_VERSION} ]]; then
    rbenv install ${RBENV_VERSION}
  fi
  rbenv rehash
  rbenv exec gem list
  rbenv rehash

  rmdir ${HOME}/.rbenv.lock
}

case "${1}" in
  exec)
    rbenv ${@}
    ;;
  install)
    install_ruby ${2}
    ;;
  pack)
    tar zcvf /tmp/dot.rbenv.tar.gz .rbenv/
    ;;
  sync)
    s3cmd sync -P /tmp/dot.rbenv.tar.gz s3://dlc.wakame.axsh.jp/wakameci/kemumaki-box-rhel6/current/dot.rbenv.tar.gz
    ;;
esac
