
{% if pillar['nodes'][grains['host']]['role'] == 'compute' %}

neutron-linuxbridge-agent:
    pkg.installed: []

/etc/neutron/l3-compute-neutron.conf:
  file.managed:
    - source: salt://neutron/files/neutron-l3-compute-neutron.conf
    - name: /etc/neutron/neutron.conf
    - template: jinja
    - require:
      - pkg: neutron-linuxbridge-agent

/etc/neutron/plugins/ml2/l3-compute-linuxbridge_agent.ini:
  file.managed:
    - source: salt://neutron/files/neutron-l3-compute-linuxbridge_agent.ini
    - name: /etc/neutron/plugins/ml2/linuxbridge_agent.ini
    - template: jinja
    - require:
      - pkg: neutron-linuxbridge-agent

{% else %}

neutron-l3-compute-avoid-error:
  test.nop:
    - name: minionAlive


{% endif %}
