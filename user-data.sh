#!/bin/sh
set -e -x

apt-get --yes --quiet update
apt-get --yes --quiet install git puppet-common

#
# Fetch puppet configuration from public git repository.
#

mv /etc/puppet /etc/puppet.orig
git clone https://github.com/5orenso/ec2-puppet-cloudinit-node.git /etc/puppet

#
# Run puppet.
#
# puppet config set gitrepo https://github.com/5orenso/simple-blog.git
# puppet config set appname simple-blog

export FACTER_gitrepo=https://github.com/5orenso/simple-blog.git
export FACTER_appname=simple-blog
puppet apply /etc/puppet/manifests/mainrun.pp
