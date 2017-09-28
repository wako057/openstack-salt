{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

include:
    - openstack.environnement-admin


cinder-create-user:
  cmd.run:
    - name: openstack user create --domain default --password {{ pillar['password']['CINDER_PASS'] }} cinder

cinder-add-role-user:
  cmd.run:
    - name: openstack role add --project service --user cinder admin


cinderv2-create-service:
  cmd.run:
    - name: openstack service create --name cinderv2 --description "{{ pillar['openstack']['cinder_description'] }}" volumev2

cinderv3-create-service:
  cmd.run:
    - name: openstack service create --name cinderv3 --description "{{ pillar['openstack']['cinder_description'] }}" volumev3



cinderv2-create-public-enpoint:
  cmd.run:
    - name: openstack endpoint create --region {{ pillar['openstack']['region'] }} volumev2 public http://{{ pillar['infra']['controller'] }}:8776/v2/%\(project_id\)s

cinderv2-create-internal-enpoint:
  cmd.run:
    - name: openstack endpoint create --region {{ pillar['openstack']['region'] }} volumev2 internal http://{{ pillar['infra']['controller'] }}:8776/v2/%\(project_id\)s

cinderv2-create-admin-enpoint:
  cmd.run:
    - name: openstack endpoint create --region {{ pillar['openstack']['region'] }} volumev2 admin http://{{ pillar['infra']['controller'] }}:8776/v2/%\(project_id\)s



cinderv3-create-public-enpoint:
  cmd.run:
    - name: openstack endpoint create --region {{ pillar['openstack']['region'] }} volumev3 public http://{{ pillar['infra']['controller'] }}:8776/v3/%\(project_id\)s

cinderv3-create-internal-enpoint:
  cmd.run:
    - name: openstack endpoint create --region {{ pillar['openstack']['region'] }} volumev3 internal http://{{ pillar['infra']['controller'] }}:8776/v3/%\(project_id\)s

cinderv3-create-admin-enpoint:
  cmd.run:
    - name: openstack endpoint create --region {{ pillar['openstack']['region'] }} volumev3 admin http://{{ pillar['infra']['controller'] }}:8776/v3/%\(project_id\)s

{% else %}

cinder-endpoint-avoid-error:
  test.nop:
    - name: minionAlive

{% endif %}