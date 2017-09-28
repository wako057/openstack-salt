{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

include:
    - openstack.environnement-admin

openstack-create-flavor-nano:
  cmd.run:
    - name: openstack flavor create --vcpus 1 --ram 64 --disk 1 nano

openstack-create-flavor-mini:
  cmd.run:
    - name: openstack flavor create --vcpus 1 --ram 1024 --disk 4 mini

openstack-create-flavor-normal:
  cmd.run:
    - name: openstack flavor create --vcpus 2 --ram 2048 --disk 10 normal

openstack-create-flavor-ramplus:
  cmd.run:
    - name: openstack flavor create --vcpus 2 --ram 4096 --disk 10 ramplus

openstack-create-flavor-large:
  cmd.run:
    - name: openstack flavor create --vcpus 2 --ram 2048 --disk 20 large

openstack-create-flavor-extralarge:
  cmd.run:
    - name: openstack flavor create --vcpus 4 --ram 4096 --disk 40 extralarge


{% else %}

openstack-create-flavor-avoid-error:
  test.nop:
    - name: minionAlive

{% endif %}