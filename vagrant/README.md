
    Testing purpose
Sub Project in the case of vm

You have to configure 2 file

Vagrantfile, in order to match the ip of you physical network, in order to make functionnal

bootstrap.sh, you have to fill the ip of the salt master, basically the Bridge Ip of the salt-master 

Once you are logged as root on the salt-master:

salt-key -A


salt '*' state.apply openstack

salt '*' state.apply database

salt '*' state.apply keystone

salt '*' state.apply glance

salt '*' state.apply nova

salt '*' state.apply neutron

salt '*' state.apply dashboard

salt '*' state.apply cinder

salt '*' state.apply heat

salt '*' state.apply openstack.restart-services

salt '*' state.apply openstack.restart-services

salt '*' state.apply openstack.flavor-create

salt '*' state.apply openstack.network-create

salt '*' state.apply openstack.security-group-rule-add
