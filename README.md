# Openstack install with Salt

The project is Tested with
- Saltstack 2017.7
- Ubuntu 16.04
- Openstack Pike (August 2017)

Architecture
- Multinode installation on physical server - vm not tested

# Requirement

The controller minion file should have the following directive in order make the database manipulation possible

mysql.default_file: '/etc/mysql/debian.cnf'


# User Configuration: Action Pillar/global_vars

You have to parameter the pillar global_vars.sls file
- Password:     The password of each services
- infra:        Define the hostname of the controller node
    - network_level:    2 Possible value, l2 OR l3, refer the documentation for more informations 
- openstack:    Region and Project name, the other entry are just information
- nodes:        Definition of your servers
    - ip:                   The management ip of the server
    - name:                 The hostname of the server
    - role:                 Can take 3 value controller / compute / storage
    - iface-provider-name:  The interface denomination of the second interface use by openstack services differ on each distro 

Host and Network Interface, you have to declare: 
- /etc/hosts: A host file: It's the file, it will be copy to the nodes 
- /etc/network/interface: On debian based distributions formated as interfaces-{%HOSTNAME%}


# Main States

- salt '*' state.apply openstack

- salt '*' state.apply database

- salt '*' state.apply keystone

- salt '*' state.apply glance

- salt '*' state.apply nova

- salt '*' state.apply neutron

- salt '*' state.apply dashboard

- salt '*' state.apply cinder

# Available States

- salt '*' state.apply chrony.chrony

- salt '*' state.apply memcached.memcached

- salt '*' state.apply rabbitmq.rabbitmq

- salt '*' state.apply network.hosts

- salt '*' state.apply network.interfaces

- salt '*' state.apply openstack.admin-environnement

- salt '*' state.apply openstack.openrc

- salt '*' state.apply openstack.general

- salt '*' state.apply database.recreatedb

- salt '*' state.apply openstack.stop-services

- salt '*' state.apply openstack.start-services

- salt '*' state.apply openstack.restart-services

- salt '*' state.apply database.mysql

- salt '*' state.apply database.ops-database-create

- salt '*' state.apply database.ops-user-create

- salt '*' state.apply database.ops-user-grant

- salt '*' state.apply keystone.endpoint-create

- salt '*' state.apply keystone.keystone

- salt '*' state.apply keystone.stop-services

- salt '*' state.apply keystone.start-services

- salt '*' state.apply keystone.restart-services

- salt '*' state.apply glance.endpoint-create

- salt '*' state.apply glance.glance

- salt '*' state.apply glance.stop-services

- salt '*' state.apply glance.start-services

- salt '*' state.apply glance.restart-services

- salt '*' state.apply nova.endpoint-create

- salt '*' state.apply nova.nova-controller

- salt '*' state.apply nova.nova-compute

- salt '*' state.apply nova.stop-services

- salt '*' state.apply nova.start-services

- salt '*' state.apply nova.restart-services

- salt '*' state.apply neutron.endpoint-create

- salt '*' state.apply neutron.neutron-l2-controller

- salt '*' state.apply neutron.neutron-l2-compute

- salt '*' state.apply neutron.neutron-l3-controller

- salt '*' state.apply neutron.neutron-l3-compute

- salt '*' state.apply neutron.stop-services

- salt '*' state.apply neutron.start-services

- salt '*' state.apply neutron.restart-services

- salt '*' state.apply cinder.endpoint-create

- salt '*' state.apply cinder.nova-controller

- salt '*' state.apply cinder.nova-storage

- salt '*' state.apply cinder.stop-services

- salt '*' state.apply cinder.start-services

- salt '*' state.apply cinder.restart-services

- salt '*' state.apply heat.endpoint-create

- salt '*' state.apply heat.heat

- salt '*' state.apply heat.stop-services

- salt '*' state.apply heat.start-services

- salt '*' state.apply heat.restart-services

