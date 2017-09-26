#!/usr/bin/env bash

source /vagrant/bootstrap.sh

apt-get install -y salt-master

echo "##########################################" > /etc/salt/master
echo "##### Primary configuration settings #####" >> /etc/salt/master
echo "##########################################" >> /etc/salt/master

echo ""  >> /etc/salt/master
echo ""  >> /etc/salt/master

echo "interface: $MASTER_IP" >> /etc/salt/master
service salt-master restart

cd /
git clone https://github.com/wako057/openstack-salt.git /srv
