{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

nova-api-stop:
    service.dead:
      - name: nova-api

nova-api-start:
    service.running:
      - name: nova-api


nova-consoleauth-stop:
    service.dead:
      - name: nova-consoleauth

nova-consoleauth-start:
    service.running:
      - name: nova-consoleauth


nova-scheduler-stop:
    service.dead:
      - name: nova-scheduler

nova-scheduler-start:
    service.running:
      - name: nova-scheduler


nova-conductor-stop:
    service.dead:
      - name: nova-conductor

nova-conductor-start:
    service.running:
      - name: nova-conductor


nova-novncproxy-stop:
    service.dead:
      - name: nova-novncproxy

nova-novncproxy-start:
    service.running:
      - name: nova-novncproxy


{% endif %}

{% if pillar['nodes'][grains['host']]['role'] == 'compute' %}

nova-compute-stop:
    service.dead:
      - name: nova-compute

nova-compute-start:
    service.running:
      - name: nova-compute


{% endif %}