{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

include:
    - openstack.admin-environnement

nova-create-user:
  cmd.run:
    - name: openstack user create --domain default --password {{ pillar['password']['NOVA_PASS'] }}  nova

nova-add-role-user:
  cmd.run:
    - name: openstack role add --project service --user nova admin

nova-create-service:
  cmd.run:
    - name: openstack service create --name nova --description "{{ pillar['openstack']['nova_description'] }}" compute

placement-create-user:
  cmd.run:
    - name: openstack user create --domain default --password {{ pillar['password']['PLACEMENT_PASS'] }} placement

placement-add-role-user:
  cmd.run:
    - name: openstack role add --project service --user placement admin

placement-create-service:
  cmd.run:
    - name: openstack service create --name placement --description "{{ pillar['openstack']['placement_description'] }}" placement

###########################
## les endpoint en question
###########################

nova-create-public-enpoint:
  cmd.run:
    - name: openstack endpoint create --region {{ pillar['openstack']['region'] }} compute public http://{{ pillar['infra']['controller'] }}:8774/v2.1

nova-create-internal-enpoint:
  cmd.run:
    - name:  openstack endpoint create --region {{ pillar['openstack']['region'] }} compute internal http://{{ pillar['infra']['controller'] }}:8774/v2.1

nova-create-admin-enpoint:
  cmd.run:
    - name: openstack endpoint create --region {{ pillar['openstack']['region'] }} compute admin http://{{ pillar['infra']['controller'] }}:8774/v2.1


placement-create-public-enpoint:
  cmd.run:
    - name: openstack endpoint create --region {{ pillar['openstack']['region'] }} placement public http://{{ pillar['infra']['controller'] }}:8778

placement-create-internal-enpoint:
  cmd.run:
    - name:  openstack endpoint create --region {{ pillar['openstack']['region'] }} placement internal http://{{ pillar['infra']['controller'] }}:8778

placement-create-admin-enpoint:
  cmd.run:
    - name: openstack endpoint create --region {{ pillar['openstack']['region'] }} placement admin http://{{ pillar['infra']['controller'] }}:8778

{% endif %}