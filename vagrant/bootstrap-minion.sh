#!/usr/bin/env bash

source /vagrant/bootstrap.sh


apt-get install -y salt-minion

echo "master: $MASTER_IP" > /etc/salt/minion
echo "mysql.default_file: '/etc/mysql/debian.cnf'" >> /etc/salt/minion
service salt-minion restart


