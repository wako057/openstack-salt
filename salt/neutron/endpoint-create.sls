
{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

include:
    - openstack.admin-environnement


neutron-create-user:
  cmd.run:
    - name: openstack user create --domain default --password {{ pillar['password']['NEUTRON_PASS'] }} neutron

neutron-add-role-user:
  cmd.run:
    - name: openstack role add --project service --user neutron admin


neutron-create-service:
  cmd.run:
    - name: openstack service create --name neutron --description "{{ pillar['openstack']['neutron_description'] }}" network


neutron-create-public-enpoint:
  cmd.run:
    - name: openstack endpoint create --region {{ pillar['openstack']['region'] }} network public http://{{ pillar['infra']['controller'] }}:9696

neutron-create-internal-enpoint:
  cmd.run:
    - name: openstack endpoint create --region {{ pillar['openstack']['region'] }} network internal http://{{ pillar['infra']['controller'] }}:9696

neutron-create-admin-enpoint:
  cmd.run:
    - name: openstack endpoint create --region {{ pillar['openstack']['region'] }} network admin http://{{ pillar['infra']['controller'] }}:9696


{% endif %}