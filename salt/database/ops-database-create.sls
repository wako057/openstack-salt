
{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

keystone_db:
  mysql_database.present:
    - name: keystone

glance_db:
  mysql_database.present:
    - name: glance

nova_db:
  mysql_database.present:
    - name: nova

nova_api_db:
  mysql_database.present:
    - name: nova_api

nova_cell0_db:
  mysql_database.present:
    - name: nova_cell0

{% endif %}