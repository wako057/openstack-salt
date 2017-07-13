
{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

include:
    - openstack.admin-environnement

glance-create-user:
  cmd.run:
    - name: openstack user create --domain default --password {{ pillar['password']['GLANCE_PASS'] }} glance


glance-add-role-user:
  cmd.run:
    - name: openstack role add --project service --user glance admin


glance-create-service:
  cmd.run:
    - name: openstack service create --name glance --description "{{ pillar['openstack']['glance_description'] }}" image


glance-create-public-enpoint:
  cmd.run:
    - name: openstack endpoint create --region {{ pillar['openstack']['region'] }} image public http://{{ pillar['infra']['controller'] }}:9292

glance-create-internal-enpoint:
  cmd.run:
    - name: openstack endpoint create --region {{ pillar['openstack']['region'] }} image internal http://{{ pillar['infra']['controller'] }}:9292

glance-create-admin-enpoint:
  cmd.run:
    - name: openstack endpoint create --region {{ pillar['openstack']['region'] }} image admin http://{{ pillar['infra']['controller'] }}:9292



{% endif %}