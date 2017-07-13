{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

dashboard-start:
    service.running:
      - name: apache2

{% endif %}