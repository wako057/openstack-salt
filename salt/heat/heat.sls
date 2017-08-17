
{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

heat-api:
    pkg.installed: []

heat-api-cfn:
    pkg.installed: []

heat-engine:
    pkg.installed: []


/etc/heat/heat.conf:
  file.managed:
    - source: salt://heat/files/heat.conf
    - template: jinja
    - require:
      - pkg: heat-api


heat-manage-db-sync:
  cmd.run:
    - name: heat-manage db_sync
    - runas: heat

{% else %}

heat-avoid-error:
  test.nop:
    - name: minionAlive

{% endif %}