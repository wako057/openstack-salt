
{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

neutron-server:
    pkg.installed: []

neutron-plugin-ml2:
    pkg.installed: []

neutron-linuxbridge-agent:
    pkg.installed: []

neutron-l3-agent:
    pkg.installed: []

neutron-dhcp-agent:
    pkg.installed: []

neutron-metadata-agent:
    pkg.installed: []


/etc/neutron/l3-controller-neutron.conf:
  file.managed:
    - source: salt://neutron/files/neutron-l3-controller-neutron.conf
    - name: /etc/neutron/neutron.conf
    - template: jinja
    - require:
      - pkg: neutron-server

/etc/neutron/plugins/ml2/l3-controller-ml2_conf.ini:
  file.managed:
    - source: salt://neutron/files/neutron-l3-controller-ml2_conf.ini
    - name: /etc/neutron/plugins/ml2/ml2_conf.ini
    - template: jinja
    - require:
      - pkg: neutron-plugin-ml2

/etc/neutron/plugins/ml2/l3-controller-linuxbridge_agent.ini:
  file.managed:
    - source: salt://neutron/files/neutron-l3-controller-linuxbridge_agent.ini
    - name: /etc/neutron/plugins/ml2/linuxbridge_agent.ini
    - template: jinja
    - require:
      - pkg: neutron-linuxbridge-agent

/etc/neutron/l3-controller-l3_agent.ini:
  file.managed:
    - source: salt://neutron/files/neutron-l3-controller-l3_agent.ini
    - name: /etc/neutron/l3_agent.ini
    - template: jinja
    - require:
      - pkg: neutron-linuxbridge-agent

/etc/neutron/l3-controller-dhcp_agent.ini:
  file.managed:
    - source: salt://neutron/files/neutron-l3-controller-dhcp_agent.ini
    - name: /etc/neutron/dhcp_agent.ini
    - template: jinja
    - require:
      - pkg: neutron-dhcp-agent

/etc/neutron/l3-controller-metadata_agent.ini:
  file.managed:
    - source: salt://neutron/files/neutron-l3-controller-metadata_agent.ini
    - name: /etc/neutron/metadata_agent.ini
    - template: jinja
    - require:
      - pkg: neutron-dhcp-agent


neutron-l3-manage-db-sync:
  cmd.run:
    - name: neutron-db-manage --config-file /etc/neutron/neutron.conf --config-file /etc/neutron/plugins/ml2/ml2_conf.ini upgrade head
    - runas: neutron


{% else %}

neutron-l3-controller-avoid-error:
  test.nop:
    - name: minionAlive



{% endif %}
