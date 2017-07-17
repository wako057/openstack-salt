include:
  - neutron.endpoint-create
{% if (pillar['infra']['network_level'] == 'l2') %}
  - neutron.neutron-l2-controller
  - neutron.neutron-l2-compute
{% elif (pillar['infra']['network_level'] == 'l3') %}
  - neutron.neutron-l3-controller
  - neutron.neutron-l3-compute
{% endif %}

  - neutron.restart-services
