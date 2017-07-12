
{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

include:
    - openstack.admin-environnement

ops-delete-service-bootstrap:
  cmd.run:
    - name: openstack project delete service


ops-delete-project:
  cmd.run:
    - name: openstack project delete {{ pillar['openstack']['project_name'] }}


ops-delete-user:
  cmd.run:
    - name: openstack user delete {{ pillar['openstack']['cloud_user'] }}

ops-delete-role-user:
  cmd.run:
    - name: openstack role delete user

ops-remove-role-user:
  cmd.run:
    - name: openstack role delete user


{% endif %}