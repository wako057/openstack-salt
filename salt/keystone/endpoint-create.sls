
{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

include:
    - openstack.admin-environnement

keystone-create-service:
  cmd.run:
    - name: openstack project create --domain default --description "{{ pillar['openstack']['service_description'] }}" service


keystone-create-project:
  cmd.run:
    - name: openstack project create --domain default --description "{{ pillar['openstack']['project_description'] }}" {{ pillar['openstack']['project_name'] }}

keystone-create-user:
  cmd.run:
    - name: openstack user create --domain default --password  {{ pillar['password']['DEMO_PASS'] }}   {{ pillar['openstack']['cloud_user'] }}

keystone-create-role-user:
  cmd.run:
    - name: openstack role create user

keystone-add-role-user:
  cmd.run:
    - name: openstack role add --project {{ pillar['openstack']['project_name'] }} --user {{ pillar['openstack']['cloud_user'] }} user


{% else %}

keystone-endpoint-create-avoid-error:
  test.nop:
    - name: minionAlive


{% endif %}