#!/usr/bin/env bash

ROOT_PASSWD='wako'
MASTER_IP='192.168.1.17'

sudo su
# Definition des mot de passe utilisateurs - root
echo root:$ROOT_PASSWD | chpasswd
apt-get install -y sudo
if [ ! -d /root/.ssh ]; then
mkdir -p /root/.ssh
fi

if [ -f /vagrant/ssh/id_rsa.pub ]; then
    cp /vagrant/ssh/id_rsa.pub  /root/.ssh/authorized_keys
fi
apt-get install -y git

git clone https://github.com/wako057/nuxminimal.git && nuxminimal/init.sh

#wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/2017.7/SALTSTACK-GPG-KEY.pub | apt-key add -

apt-get install -y salt-minion
#echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main" >  /etc/apt/sources.list.d/saltstack.list
#apt-get update
#apt-get dist-upgrade -y
#apt-get install -y salt-minion

echo "master: $MASTER_IP" > /etc/salt/minion

echo "mysql.default_file: '/etc/mysql/debian.cnf'" >> /etc/salt/minion
service salt-minion restart
#echo ''