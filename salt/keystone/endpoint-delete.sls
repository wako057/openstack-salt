
{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

include:
    - openstack.admin-environnement

keystone-delete-service-bootstrap:
  cmd.run:
    - name: openstack project delete service


keystone-delete-project:
  cmd.run:
    - name: openstack project delete {{ pillar['openstack']['project_name'] }}


keystone-delete-user:
  cmd.run:
    - name: openstack user delete {{ pillar['openstack']['cloud_user'] }}

keystone-delete-role-user:
  cmd.run:
    - name: openstack role delete user

keystone-remove-role-user:
  cmd.run:
    - name: openstack role delete user


{% endif %}