


salt '*' state.apply openstack.prerequis

salt '*' state.apply openstack.general

salt '*' state.apply openstack-openrc

salt '*' state.apply keystone

salt '*' state.apply glance

salt '*' state.apply nova

===================================
=============== OLD ===============
===================================

salt '*' state.apply network.hosts

salt '*' state.apply network.interfaces

salt '*' state.apply  openstack.general

salt '*' state.apply database.mysql

salt '*' state.apply database.ops-database-create

salt '*' state.apply database.ops-user-create

salt '*' state.apply database.ops-user-grant

salt '*' state.apply rabbitmq.rabbitmq

salt '*' state.apply memcached.memcached

salt '*' state.apply  openstack.general

salt '*' state.apply  keystone.keystone

salt '*' state.apply  keystone.endpoint-create

                                                    salt '*' state.apply mysql.remove_test_database
                                                    
                                                    salt '*' mysql.processlist


