
{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

include:
    - openstack.admin-environnement

ops-create-service-bootstrap:
  cmd.run:
    - name: openstack project create --domain default --description "{{ pillar['openstack']['service_description'] }}" service


ops-create-project:
  cmd.run:
    - name: openstack project create --domain default --description "{{ pillar['openstack']['project_description'] }}" "{{ pillar['openstack']['project_name'] }}"

ops-create-user:
  cmd.run:
    - name: openstack user create --domain default --password  {{ pillar['password']['DEMO_PASS'] }}   {{ pillar['openstack']['cloud_user'] }}

ops-create-role-user:
  cmd.run:
    - name: openstack role create user

ops-add-role-user:
  cmd.run:
    - name: openstack role add --project {{ pillar['openstack']['project_name'] }} --user {{ pillar['openstack']['cloud_user'] }} user


{% endif %}