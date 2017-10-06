{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

openstack-dashboard:
    pkg.installed: []

{% if (pillar['infra']['network_level'] == 'l2') %}

/etc/openstack-dashboard/l2-local_settings.py:
  file.managed:
    - source: salt://dashboard/files/l2-local_settings.py
    - name: /etc/openstack-dashboard/local_settings.py
    - user: www-data
    - group: www-data
    - template: jinja
    - require:
      - pkg: openstack-dashboard

{% elif (pillar['infra']['network_level'] == 'l3') %}

/etc/openstack-dashboard/l3-local_settings.py:
  file.managed:
    - source: salt://dashboard/files/l3-local_settings.py
    - name: /etc/openstack-dashboard/local_settings.py
    - user: www-data
    - group: www-data
    - template: jinja
    - require:
      - pkg: openstack-dashboard

{% endif %}

/var/lib/openstack-dashboard/secret_key:
 file.managed:
    - name: /var/lib/openstack-dashboard/secret_key
    - user: www-data
    - group: www-data
    - require:
      - pkg: openstack-dashboard

{% else %}

dashboard-avoid-error:
  test.nop:
    - name: minionAlive

{% endif %}