
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


glance-registry-stop:
    service.dead:
      - name: glance-registry

glance-registry-start:
    service.running:
      - name: glance-registry

glance-api-stop:
    service.dead:
      - name: glance-api
glance-api-start:
    service.running:
      - name: glance-api
{% endif %}