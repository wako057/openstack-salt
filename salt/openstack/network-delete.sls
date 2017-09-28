{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

include:
    - openstack.environnement-admin

openstack-delete-subnet:
  cmd.run:
    - name: openstack subnet delete provider


openstack-delete-network:
  cmd.run:
    - name: openstack network delete provider



{% else %}

openstack-delete-network-avoid-error:
  test.nop:
    - name: minionAlive

{% endif %}