{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

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