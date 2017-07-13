
{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

nova-api-start:
    service.running:
      - name: nova-api

nova-consoleauth-start:
    service.running:
      - name: nova-consoleauth

nova-scheduler-start:
    service.running:
      - name: nova-scheduler

nova-conductor-start:
    service.running:
      - name: nova-conductor

nova-novncproxy-start:
    service.running:
      - name: nova-novncproxy


{% elif pillar['nodes'][grains['host']]['role'] == 'compute' %}

nova-compute-start:
    service.running:
      - name: nova-compute

{% endif %}