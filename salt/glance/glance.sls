
{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

glance:
    pkg.installed: []

/etc/glance/glance-api.conf:
  file.managed:
    - source: salt://glance/files/glance-api.conf
    - template: jinja
    - require:
      - pkg: glance

/etc/glance/glance-registry.conf:
  file.managed:
    - source: salt://glance/files/glance-registry.conf
    - template: jinja
    - require:
      - pkg: glance


glance-manage-db-sync:
  cmd.run:
    - name: glance-manage db_sync
    - runas: glance

{% endif %}