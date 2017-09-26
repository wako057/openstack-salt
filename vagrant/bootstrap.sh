
ROOT_PASSWD='wako'
MASTER_IP='192.168.1.220'


# Definition des mot de passe utilisateurs - root
echo root:$ROOT_PASSWD | chpasswd
apt-get install -y sudo
if [ ! -d /root/.ssh ]; then
mkdir -p /root/.ssh
fi

if [ -f /vagrant/ssh/id_rsa.pub ]; then
    cp /vagrant/ssh/id_rsa.pub  /root/.ssh/authorized_keys
fi


wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
echo 'deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main' > /etc/apt/sources.list.d/saltstack.list
apt-get update

apt-get install -y git htop

git clone https://github.com/wako057/nuxminimal.git && nuxminimal/init.sh

