
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


glance-registry-restart:
    service.running:
        - name: glance-registry
        - full_restart: true

glance-api-restart:
    service.running:
        - name: glance-api
        - full_restart: true
{% endif %}