{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

keystone_delete_db:
  mysql_database.absent:
    - name: keystone

glance_delete_db:
  mysql_database.absent:
    - name: glance

nova_delete_db:
  mysql_database.absent:
    - name: nova

nova_api_delete_db:
  mysql_database.absent:
    - name: nova_api

nova_cell0_delete_db:
  mysql_database.absent:
    - name: nova_cell0

neutron_delete_db:
  mysql_database.absent:
    - name: neutron

cinder_delete_db:
  mysql_database.absent:
    - name: cinder

heat_delete_db:
  mysql_database.absent:
    - name: heat

magnum_delete_db:
  mysql_database.absent:
    - name: magnum

{% endif%}