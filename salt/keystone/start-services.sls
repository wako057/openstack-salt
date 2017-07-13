{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

keystone-start:
    service.running:
      - name: apache2

{% endif %}