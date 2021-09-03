#!/bin/bash

set -xe

PROJECT_RUBY_VERSION=$1
USERNAME=$2

rvm install "ruby-${PROJECT_RUBY_VERSION}"
mkdir -p /home/${USERNAME}/data/rvm

echo 'Files here are expected to be mounted across containers' > /home/${USERNAME}/data/README

sudo -u ${USERNAME} ln -nfs /home/${USERNAME}/data/rvm /home/${USERNAME}/.rvm
chown ${USERNAME}:${USERNAME} -R /home/${USERNAME}/data
sudo -u ${USERNAME} bash --login -c 'rvm user gemsets'