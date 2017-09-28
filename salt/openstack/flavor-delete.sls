{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

include:
    - openstack.environnement-admin

openstack-delete-flavor-nano:
  cmd.run:
    - name: openstack flavor delete nano

openstack-delete-flavor-mini:
  cmd.run:
    - name: openstack flavor delete mini

openstack-delete-flavor-normal:
  cmd.run:
    - name: openstack flavor delete normal

openstack-delete-flavor-ramplus:
  cmd.run:
    - name: openstack flavor delete ramplus

openstack-delete-flavor-large:
  cmd.run:
    - name: openstack flavor delete large


openstack-delete-flavor-extralarge:
  cmd.run:
    - name: openstack flavor delete extralarge


{% else %}

openstack-delete-flavor-avoid-error:
  test.nop:
    - name: minionAlive

{% endif %}