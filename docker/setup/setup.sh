#!/bin/bash
set -e
set -x

################################################################################
# install packages
################################################################################

apt-get update -qq
cat /tmp/apt-packages.txt | xargs apt-get -qq --yes --force-yes install

curl -sL https://deb.nodesource.com/setup_8.x | bash -
apt-get update -qq && apt-get install nodejs

pip3 install awscli --upgrade
mkdir -p ~/.aws

################################################################################
# last steps and cleaning
################################################################################

apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
