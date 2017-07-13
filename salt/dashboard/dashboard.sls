{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

openstack-dashboard:
    pkg.installed: []


/etc/openstack-dashboard/l2-local_settings.py:
  file.managed:
    - source: salt://keystone/files/keystone.conf
    - template: jinja
    - require:
      - pkg: keystone


{% endif %}