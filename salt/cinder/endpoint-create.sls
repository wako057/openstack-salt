{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

include:
    - openstack.admin-environnement


cinder-create-user:
  cmd.run:
    - name: openstack user create --domain default --password {{ pillar['password']['NEUTRON_PASS'] }} neutron


{% endif %}