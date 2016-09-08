#!/bin/bash

set -eu

: $1

source $1/lib/conveni.sh

if has "apt-get"; then
  # bash $1/linux/10_aptget.sh $1
  exit 0
fi

if has "yum"; then
  # bash $1/linux/10_yum.sh $1
  exit 0
fi

exit 0
