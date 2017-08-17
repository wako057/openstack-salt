{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

neutron-server-stop:
    service.dead:
      - name: neutron-server

neutron-linuxbridge-agent-stop:
    service.dead:
      - name: neutron-linuxbridge-agent


neutron-dhcp-agent-stop:
    service.dead:
      - name: neutron-dhcp-agent

neutron-metadata-agent-stop:
    service.dead:
      - name: neutron-metadata-agent

{% if (pillar['infra']['network_level'] == 'l3') %}
neutron-l3-agent-stop:
    service.dead:
      - name: neutron-l3-agent
{% endif %}


{% elif pillar['nodes'][grains['host']]['role'] == 'compute' %}

neutron-linuxbridge-compute-agent-stop:
    service.dead:
      - name: neutron-linuxbridge-agent



{% else %}

neutron-stop-avoid-error:
  test.nop:
    - name: minionAlive


{% endif %}