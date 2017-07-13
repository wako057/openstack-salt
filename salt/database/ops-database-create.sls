
{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

keystone_create_db:
  mysql_database.present:
    - name: keystone

glance_create_db:
  mysql_database.present:
    - name: glance

nova_create_db:
  mysql_database.present:
    - name: nova

nova_api_create_db:
  mysql_database.present:
    - name: nova_api

nova_cell0_create_db:
  mysql_database.present:
    - name: nova_cell0

neutron_create_db:
  mysql_database.present:
    - name: neutron

cinder_create_db:
  mysql_database.present:
    - name: cinder


{% endif %}