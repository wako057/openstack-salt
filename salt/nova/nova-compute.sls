{% if pillar['nodes'][grains['host']]['role'] == 'compute' %}

nova-compute:
    pkg.installed: []


/etc/nova/nova.conf:
  file.managed:
    - source: salt://nova/files/compute-nova.conf
    - template: jinja
    - require:
      - pkg: nova-compute

{% else %}

nova-compute-avoid-error:
  test.nop:
    - name: minionAlive

{% endif %}