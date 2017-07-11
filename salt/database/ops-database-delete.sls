{% if pillar['infra'][grains['host']] == 'controller' %}

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

{% endif%}