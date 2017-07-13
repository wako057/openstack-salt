{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

openstack-dashboard:
    pkg.installed: []

/etc/openstack-dashboard/l2-local_settings.py:
  file.managed:
    - source: salt://dashboard/files/l2-local_settings.py
    - name: /etc/openstack-dashboard/local_settings.py
    - user: www-data
    - group: www-data
    - template: jinja
    - require:
      - pkg: openstack-dashboard


/var/lib/openstack-dashboard/secret_key:
 file.managed:
    - name: /var/lib/openstack-dashboard/secret_key
    - user: www-data
    - group: www-data
    - require:
      - pkg: openstack-dashboard


{% endif %}