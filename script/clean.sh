#!/usr/bin/env bash

set -e

source 'script/common.sh'

OLD_GITCONFIG="git/gitconfig.local.symlink"

info "clean.sh - Start"

if [ -f $OLD_GITCONFIG ]
then
  info "Removing $OLD_GITCONFIG"
  rm $OLD_GITCONFIG
else
  info "$OLD_GITCONFIG not found."
fi

info "clean.sh - End"
