#!/bin/bash

# lancé en root on peut avancer
cd
apt-get update
apt-get dist-upgrade -y
apt-get install -y git curl mlocate
git clone https://github.com/wako057/nuxminimal.git && nuxminimal/init.sh


wget -O - https://repo.saltstack.com/apt/debian/8/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add -
echo "deb http://repo.saltstack.com/apt/debian/8/amd64/latest jessie main" > /etc/apt/sources.list.d/saltstack.list
apt-get update
apt-get install -y salt-master

IP_LAN=`hostname -I`

sed -i -e "s/\#interface\:\ 0\.0\.0\.0/interface\:\ $IP_LAN/g" /etc/salt/master
echo ''
/etc/init.d/salt-master restart

echo "On demande le reboot pour finaliser"
reboot