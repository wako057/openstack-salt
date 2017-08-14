#!/bin/bash

IP_SALT_MASTER="192.168.3.54"

# lancé en root on peut avancer
cd
apt-get update
apt-get dist-upgrade -y
apt-get install -y git curl mlocate htop
git clone https://github.com/wako057/nuxminimal.git && nuxminimal/init.sh

wget -O - https://repo.saltstack.com/apt/debian/8/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add -
echo "deb http://repo.saltstack.com/apt/debian/8/amd64/latest jessie main" > /etc/apt/sources.list.d/saltstack.list
apt-get update
apt-get install -y salt-minion


sed -i -e "s/\#master\:\ salt/master\:\ $IP_SALT_MASTER/g" /etc/salt/minion
/etc/init.d/salt-minion restart

echo "On demande le reboot pour finaliser"
reboot