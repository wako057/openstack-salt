{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

glance-registry-start:
    service.running:
      - name: glance-registry

glance-api-start:
    service.running:
      - name: glance-api

{% endif %}