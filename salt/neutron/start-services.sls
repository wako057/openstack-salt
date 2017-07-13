{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}


neutron-server-start:
    service.running:
      - name: neutron-server

neutron-linuxbridge-agent-start:
    service.running:
      - name: neutron-linuxbridge-agent


neutron-dhcp-agent-start:
    service.running:
      - name: neutron-dhcp-agent



neutron-metadata-agent-start:
    service.running:
      - name: neutron-metadata-agent




{% if (pillar['infra']['network_level'] == 'l3') %}

neutron-l3-agent-start:
    service.running:
      - name: neutron-l3-agent

{% endif %}


{% elif pillar['nodes'][grains['host']]['role'] == 'compute' %}

neutron-linuxbridge-compute-agent-start:
    service.running:
      - name: neutron-linuxbridge-agent

{% endif %}