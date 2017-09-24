#!/usr/bin/env bash

ROOT_PASSWD='wako'


# Definition des mot de passe utilisateurs -
# root
echo root:$ROOT_PASSWD | chpasswd

if [ ! -d /root/.ssh ]; then
mkdir -p /root/.ssh
fi


if [ -f /vagrant/ssh/id_rsa.pub ]; then
    cp /vagrant/ssh/id_rsa.pub  /root/.ssh/authorized_keys
fi
