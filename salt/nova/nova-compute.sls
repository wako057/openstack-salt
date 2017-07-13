{% if pillar['nodes'][grains['host']]['role'] == 'compute' %}

nova-compute:
    pkg.installed: []


/etc/nova/nova.conf:
  file.managed:
    - source: salt://nova/files/compute-nova.conf
    - template: jinja
    - require:
      - pkg: nova-compute


nova-compute-stop:
    service.dead:
      - name: nova-compute

nova-compute-start:
    service.running:
      - name: nova-compute


{% endif %}