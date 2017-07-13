{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

nova-api:
    pkg.installed: []

nova-conductor:
    pkg.installed: []

nova-consoleauth:
    pkg.installed: []

nova-novncproxy:
    pkg.installed: []

nova-scheduler:
    pkg.installed: []

nova-placement-api:
    pkg.installed: []



/etc/nova/nova.conf:
  file.managed:
    - source: salt://nova/files/controller-nova.conf
    - template: jinja
    - require:
      - pkg: nova-api




nova_api-manage-db-sync:
  cmd.run:
    - name: nova-manage api_db sync
    - runas: nova

nova_cell0-register-db:
  cmd.run:
    - name: nova-manage cell_v2 map_cell0
    - runas: nova

nova_cell0-create-cell:
  cmd.run:
    - name: nova-manage cell_v2 create_cell --name=cell1 --verbose
    - runas: nova

nova-manage-db-sync:
  cmd.run:
    - name: nova-manage db sync
    - runas: nova



{% endif %}