{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

include:
    - openstack.admin-environnement

openstack-create-network:
  cmd.run:
    - name: openstack network create --share --external --provider-physical-network provider --provider-network-type flat provider


openstack-create-subnet:
  cmd.run:
    - name: openstack subnet create --network provider --allocation-pool start={{pillar['infra']['provider_network_pool_start']}},end={{pillar['infra']['provider_network_pool_end']}} --dns-nameserver {{pillar['infra']['dns_nameserver']}} --gateway {{pillar['infra']['provider_network_gate']}} --subnet-range {{pillar['infra']['provider_network_cidr']}} provider


{% else %}

openstack-create-network-avoid-error:
  test.nop:
    - name: minionAlive

{% endif %}