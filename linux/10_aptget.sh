#!/bin/bash

set -eu

: $1

source $1/lib/conveni.sh

# before install
sudo apt-get install -y python-software-properties
sudo apt-get update -y

# install
sudo apt-get install -y git
sudo apt-get install -y zsh

